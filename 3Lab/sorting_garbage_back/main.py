import os
import shutil
from datetime import datetime
from PIL import Image
from torchvision import transforms, models
import torch
from fastapi import FastAPI, UploadFile, File, HTTPException
from torch import nn

app = FastAPI()

UPLOAD_FOLDER = 'uploads'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
print(f'Using device: {device}')
classes = ['Стекло', 'Металл', 'Органические отходы', 'Бумага и картон', 'Пластик', 'Текстиль']
model_path = "best_model.pth"
val_transform = transforms.Compose([
    transforms.Resize((224, 224)),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
])


class SimpleClassifier(nn.Module):
    def __init__(self, num_classes=6):
        super(SimpleClassifier, self).__init__()
        self.backbone = models.resnet18(pretrained=True)

        # Замораживаем начальные слои (опционально)
        for param in self.backbone.parameters():
            param.requires_grad = False

        # Размораживаем последние слои
        for param in self.backbone.layer4.parameters():
            param.requires_grad = True

        num_features = self.backbone.fc.in_features
        self.backbone.fc = nn.Linear(num_features, num_classes)

    def forward(self, x):
        return self.backbone(x)


def load_trained_model(model_path, num_classes, device):
    """Загружает готовую модель из файла"""
    model = SimpleClassifier(num_classes=num_classes)
    model.load_state_dict(torch.load(model_path, map_location=device))
    model.to(device)
    model.eval()
    print(f"Model loaded from {model_path}")
    return model


model = load_trained_model(model_path, len(classes), device)


def predict_image(model, image_path, transform, device, classes):
    model.eval()
    image = Image.open(image_path).convert('RGB')
    image_tensor = transform(image).unsqueeze(0).to(device)

    with torch.no_grad():
        output = model(image_tensor)
        probabilities = torch.softmax(output, dim=1)
        confidence, predicted = torch.max(probabilities, 1)

    predicted_class = classes[predicted.item()]
    confidence = confidence.item()

    return predicted_class, confidence


@app.post("/upload")
async def upload_photo(photo: UploadFile = File(...)):
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S_%f")
    name, ext = os.path.splitext(photo.filename)
    filename = f"{name}_{timestamp}{ext}"
    file_path = os.path.join(UPLOAD_FOLDER, filename)

    try:
        with open(file_path, "wb") as buffer:
            shutil.copyfileobj(photo.file, buffer)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error saving file: {str(e)}")

    result = predict_image(model, file_path, val_transform, device, classes)

    return {
        "message": result,
        "filename": filename,
        "file_path": file_path
    }


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000)
