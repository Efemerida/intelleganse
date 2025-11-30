// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageResponseDto {

 List<dynamic> get message; String get filename;@JsonKey(name: 'file_path') String get filePath;
/// Create a copy of MessageResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageResponseDtoCopyWith<MessageResponseDto> get copyWith => _$MessageResponseDtoCopyWithImpl<MessageResponseDto>(this as MessageResponseDto, _$identity);

  /// Serializes this MessageResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageResponseDto&&const DeepCollectionEquality().equals(other.message, message)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.filePath, filePath) || other.filePath == filePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(message),filename,filePath);

@override
String toString() {
  return 'MessageResponseDto(message: $message, filename: $filename, filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class $MessageResponseDtoCopyWith<$Res>  {
  factory $MessageResponseDtoCopyWith(MessageResponseDto value, $Res Function(MessageResponseDto) _then) = _$MessageResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<dynamic> message, String filename,@JsonKey(name: 'file_path') String filePath
});




}
/// @nodoc
class _$MessageResponseDtoCopyWithImpl<$Res>
    implements $MessageResponseDtoCopyWith<$Res> {
  _$MessageResponseDtoCopyWithImpl(this._self, this._then);

  final MessageResponseDto _self;
  final $Res Function(MessageResponseDto) _then;

/// Create a copy of MessageResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? filename = null,Object? filePath = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as List<dynamic>,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageResponseDto].
extension MessageResponseDtoPatterns on MessageResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _MessageResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _MessageResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<dynamic> message,  String filename, @JsonKey(name: 'file_path')  String filePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageResponseDto() when $default != null:
return $default(_that.message,_that.filename,_that.filePath);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<dynamic> message,  String filename, @JsonKey(name: 'file_path')  String filePath)  $default,) {final _that = this;
switch (_that) {
case _MessageResponseDto():
return $default(_that.message,_that.filename,_that.filePath);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<dynamic> message,  String filename, @JsonKey(name: 'file_path')  String filePath)?  $default,) {final _that = this;
switch (_that) {
case _MessageResponseDto() when $default != null:
return $default(_that.message,_that.filename,_that.filePath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageResponseDto implements MessageResponseDto {
  const _MessageResponseDto({required final  List<dynamic> message, required this.filename, @JsonKey(name: 'file_path') required this.filePath}): _message = message;
  factory _MessageResponseDto.fromJson(Map<String, dynamic> json) => _$MessageResponseDtoFromJson(json);

 final  List<dynamic> _message;
@override List<dynamic> get message {
  if (_message is EqualUnmodifiableListView) return _message;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_message);
}

@override final  String filename;
@override@JsonKey(name: 'file_path') final  String filePath;

/// Create a copy of MessageResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageResponseDtoCopyWith<_MessageResponseDto> get copyWith => __$MessageResponseDtoCopyWithImpl<_MessageResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageResponseDto&&const DeepCollectionEquality().equals(other._message, _message)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.filePath, filePath) || other.filePath == filePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_message),filename,filePath);

@override
String toString() {
  return 'MessageResponseDto(message: $message, filename: $filename, filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class _$MessageResponseDtoCopyWith<$Res> implements $MessageResponseDtoCopyWith<$Res> {
  factory _$MessageResponseDtoCopyWith(_MessageResponseDto value, $Res Function(_MessageResponseDto) _then) = __$MessageResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<dynamic> message, String filename,@JsonKey(name: 'file_path') String filePath
});




}
/// @nodoc
class __$MessageResponseDtoCopyWithImpl<$Res>
    implements _$MessageResponseDtoCopyWith<$Res> {
  __$MessageResponseDtoCopyWithImpl(this._self, this._then);

  final _MessageResponseDto _self;
  final $Res Function(_MessageResponseDto) _then;

/// Create a copy of MessageResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? filename = null,Object? filePath = null,}) {
  return _then(_MessageResponseDto(
message: null == message ? _self._message : message // ignore: cast_nullable_to_non_nullable
as List<dynamic>,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
