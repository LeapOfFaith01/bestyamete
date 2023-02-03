// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DownloadItem _$DownloadItemFromJson(Map<String, dynamic> json) {
  return _DownloadItem.fromJson(json);
}

/// @nodoc
mixin _$DownloadItem {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  dynamic get url => throw _privateConstructorUsedError;
  set url(dynamic value) => throw _privateConstructorUsedError;
  dynamic get videoId => throw _privateConstructorUsedError;
  set videoId(dynamic value) => throw _privateConstructorUsedError;
  String? get itemID => throw _privateConstructorUsedError;
  set itemID(String? value) => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  set progress(int value) => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  set status(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DownloadItemCopyWith<DownloadItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadItemCopyWith<$Res> {
  factory $DownloadItemCopyWith(
          DownloadItem value, $Res Function(DownloadItem) then) =
      _$DownloadItemCopyWithImpl<$Res, DownloadItem>;
  @useResult
  $Res call(
      {String name,
      dynamic url,
      dynamic videoId,
      String? itemID,
      int progress,
      int? status});
}

/// @nodoc
class _$DownloadItemCopyWithImpl<$Res, $Val extends DownloadItem>
    implements $DownloadItemCopyWith<$Res> {
  _$DownloadItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = freezed,
    Object? videoId = freezed,
    Object? itemID = freezed,
    Object? progress = null,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as dynamic,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      itemID: freezed == itemID
          ? _value.itemID
          : itemID // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DownloadItemCopyWith<$Res>
    implements $DownloadItemCopyWith<$Res> {
  factory _$$_DownloadItemCopyWith(
          _$_DownloadItem value, $Res Function(_$_DownloadItem) then) =
      __$$_DownloadItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      dynamic url,
      dynamic videoId,
      String? itemID,
      int progress,
      int? status});
}

/// @nodoc
class __$$_DownloadItemCopyWithImpl<$Res>
    extends _$DownloadItemCopyWithImpl<$Res, _$_DownloadItem>
    implements _$$_DownloadItemCopyWith<$Res> {
  __$$_DownloadItemCopyWithImpl(
      _$_DownloadItem _value, $Res Function(_$_DownloadItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = freezed,
    Object? videoId = freezed,
    Object? itemID = freezed,
    Object? progress = null,
    Object? status = freezed,
  }) {
    return _then(_$_DownloadItem(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url ? _value.url! : url,
      videoId: freezed == videoId ? _value.videoId! : videoId,
      itemID: freezed == itemID
          ? _value.itemID
          : itemID // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DownloadItem implements _DownloadItem {
  _$_DownloadItem(
      {required this.name,
      this.url,
      this.videoId,
      this.itemID,
      this.progress = 0,
      this.status});

  factory _$_DownloadItem.fromJson(Map<String, dynamic> json) =>
      _$$_DownloadItemFromJson(json);

  @override
  String name;
  @override
  dynamic url;
  @override
  dynamic videoId;
  @override
  String? itemID;
  @override
  @JsonKey()
  int progress;
  @override
  int? status;

  @override
  String toString() {
    return 'DownloadItem(name: $name, url: $url, videoId: $videoId, itemID: $itemID, progress: $progress, status: $status)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadItemCopyWith<_$_DownloadItem> get copyWith =>
      __$$_DownloadItemCopyWithImpl<_$_DownloadItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DownloadItemToJson(
      this,
    );
  }
}

abstract class _DownloadItem implements DownloadItem {
  factory _DownloadItem(
      {required String name,
      dynamic url,
      dynamic videoId,
      String? itemID,
      int progress,
      int? status}) = _$_DownloadItem;

  factory _DownloadItem.fromJson(Map<String, dynamic> json) =
      _$_DownloadItem.fromJson;

  @override
  String get name;
  set name(String value);
  @override
  dynamic get url;
  set url(dynamic value);
  @override
  dynamic get videoId;
  set videoId(dynamic value);
  @override
  String? get itemID;
  set itemID(String? value);
  @override
  int get progress;
  set progress(int value);
  @override
  int? get status;
  set status(int? value);
  @override
  @JsonKey(ignore: true)
  _$$_DownloadItemCopyWith<_$_DownloadItem> get copyWith =>
      throw _privateConstructorUsedError;
}
