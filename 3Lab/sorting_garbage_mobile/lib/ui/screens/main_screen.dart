import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sorting_garbage/config/locator.dart';
import 'package:sorting_garbage/data/repository/sorting_repository.dart';
import 'package:sorting_garbage/data/repository_impl/sorting_repository_impl.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  XFile? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  String _message = '';
  String _procent = '';
  bool _isLoad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F7),
      appBar: AppBar(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Сортировщик мусора',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _getContentWidget(),
    );
  }

  Widget _getContentWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Карточка
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Превью изображения
                  _selectedImage != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      File(_selectedImage!.path),
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.photo,
                      color: Colors.green,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Загрузите изображение",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _isLoad?CircularProgressIndicator():Text(
                    _message.isEmpty?"Выберите фото из галереи или сделайте новое.\n"
                        "Изображение будет отправлено на сервер\nдля анализа.":""
                        "${_message}\n${_procent}%",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Кнопки
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: pickFromCamera,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text("Сделать фото"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: pickFromGallery,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(color: Colors.green, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            "Галерея",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> requestGalleryPermission() async {
    if (await Permission.photos.isGranted || await Permission.storage.isGranted) {
      return true;
    }

    final photos = await Permission.photos.request();
    final storage = await Permission.storage.request();

    return photos.isGranted || storage.isGranted;
  }

  Future<void> pickFromGallery() async {
    bool ok = await requestGalleryPermission();
    if (!ok) return;

    final XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        _selectedImage = img;
        _isLoad = true;
      });
      locator<SortingRepository>().upload(File(_selectedImage!.path)).then((mes){
        locator<Logger>().w(mes.message[0]);
        setState(() {
          _isLoad = false;
          _message = mes.message[0];
          _procent = (mes.message[1]*100 as double).toStringAsFixed(2);
        });
      });
    }
  }

  Future<void> pickFromCamera() async {
    final XFile? img = await _picker.pickImage(source: ImageSource.camera);
    if (img != null) {
      setState(() {
        _selectedImage = img;
        _isLoad = true;
      });
      locator<SortingRepository>().upload(File(_selectedImage!.path)).then((mes){
        locator<Logger>().w(mes.message[0]);
        setState(() {
          _isLoad = false;
          _message = mes.message[0];
          _procent = (mes.message[1]*100 as double).toStringAsFixed(2);
        });
      });
    }
  }
}