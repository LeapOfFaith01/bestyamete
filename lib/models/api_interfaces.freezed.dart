// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_interfaces.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Episodio _$EpisodioFromJson(Map<String, dynamic> json) {
  return _Episodio.fromJson(json);
}

/// @nodoc
mixin _$Episodio {
  @JsonKey(name: 'video_id')
  String? get videoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String? get categoryId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_image')
  String? get categoryImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodioCopyWith<Episodio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodioCopyWith<$Res> {
  factory $EpisodioCopyWith(Episodio value, $Res Function(Episodio) then) =
      _$EpisodioCopyWithImpl<$Res, Episodio>;
  @useResult
  $Res call(
      {@JsonKey(name: 'video_id') String? videoId,
      @JsonKey(name: 'category_id') String? categoryId,
      String? title,
      @JsonKey(name: 'category_image') String? categoryImage});
}

/// @nodoc
class _$EpisodioCopyWithImpl<$Res, $Val extends Episodio>
    implements $EpisodioCopyWith<$Res> {
  _$EpisodioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = freezed,
    Object? categoryId = freezed,
    Object? title = freezed,
    Object? categoryImage = freezed,
  }) {
    return _then(_value.copyWith(
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImage: freezed == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EpisodioCopyWith<$Res> implements $EpisodioCopyWith<$Res> {
  factory _$$_EpisodioCopyWith(
          _$_Episodio value, $Res Function(_$_Episodio) then) =
      __$$_EpisodioCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'video_id') String? videoId,
      @JsonKey(name: 'category_id') String? categoryId,
      String? title,
      @JsonKey(name: 'category_image') String? categoryImage});
}

/// @nodoc
class __$$_EpisodioCopyWithImpl<$Res>
    extends _$EpisodioCopyWithImpl<$Res, _$_Episodio>
    implements _$$_EpisodioCopyWith<$Res> {
  __$$_EpisodioCopyWithImpl(
      _$_Episodio _value, $Res Function(_$_Episodio) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = freezed,
    Object? categoryId = freezed,
    Object? title = freezed,
    Object? categoryImage = freezed,
  }) {
    return _then(_$_Episodio(
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImage: freezed == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Episodio implements _Episodio {
  const _$_Episodio(
      {@JsonKey(name: 'video_id') this.videoId,
      @JsonKey(name: 'category_id') this.categoryId,
      this.title,
      @JsonKey(name: 'category_image') this.categoryImage});

  factory _$_Episodio.fromJson(Map<String, dynamic> json) =>
      _$$_EpisodioFromJson(json);

  @override
  @JsonKey(name: 'video_id')
  final String? videoId;
  @override
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @override
  final String? title;
  @override
  @JsonKey(name: 'category_image')
  final String? categoryImage;

  @override
  String toString() {
    return 'Episodio(videoId: $videoId, categoryId: $categoryId, title: $title, categoryImage: $categoryImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Episodio &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.categoryImage, categoryImage) ||
                other.categoryImage == categoryImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, videoId, categoryId, title, categoryImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EpisodioCopyWith<_$_Episodio> get copyWith =>
      __$$_EpisodioCopyWithImpl<_$_Episodio>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodioToJson(
      this,
    );
  }
}

abstract class _Episodio implements Episodio {
  const factory _Episodio(
          {@JsonKey(name: 'video_id') final String? videoId,
          @JsonKey(name: 'category_id') final String? categoryId,
          final String? title,
          @JsonKey(name: 'category_image') final String? categoryImage}) =
      _$_Episodio;

  factory _Episodio.fromJson(Map<String, dynamic> json) = _$_Episodio.fromJson;

  @override
  @JsonKey(name: 'video_id')
  String? get videoId;
  @override
  @JsonKey(name: 'category_id')
  String? get categoryId;
  @override
  String? get title;
  @override
  @JsonKey(name: 'category_image')
  String? get categoryImage;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodioCopyWith<_$_Episodio> get copyWith =>
      throw _privateConstructorUsedError;
}

Anime _$AnimeFromJson(Map<String, dynamic> json) {
  return _Anime.fromJson(json);
}

/// @nodoc
mixin _$Anime {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_image')
  String? get categoryImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'video_id')
  String? get videoId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeCopyWith<Anime> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeCopyWith<$Res> {
  factory $AnimeCopyWith(Anime value, $Res Function(Anime) then) =
      _$AnimeCopyWithImpl<$Res, Anime>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      @JsonKey(name: 'category_id') String? categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_image') String? categoryImage,
      @JsonKey(name: 'video_id') String? videoId});
}

/// @nodoc
class _$AnimeCopyWithImpl<$Res, $Val extends Anime>
    implements $AnimeCopyWith<$Res> {
  _$AnimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? categoryImage = freezed,
    Object? videoId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImage: freezed == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnimeCopyWith<$Res> implements $AnimeCopyWith<$Res> {
  factory _$$_AnimeCopyWith(_$_Anime value, $Res Function(_$_Anime) then) =
      __$$_AnimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      @JsonKey(name: 'category_id') String? categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_image') String? categoryImage,
      @JsonKey(name: 'video_id') String? videoId});
}

/// @nodoc
class __$$_AnimeCopyWithImpl<$Res> extends _$AnimeCopyWithImpl<$Res, _$_Anime>
    implements _$$_AnimeCopyWith<$Res> {
  __$$_AnimeCopyWithImpl(_$_Anime _value, $Res Function(_$_Anime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? categoryImage = freezed,
    Object? videoId = freezed,
  }) {
    return _then(_$_Anime(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImage: freezed == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Anime implements _Anime {
  const _$_Anime(
      {this.id,
      this.title,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'category_name') this.categoryName,
      @JsonKey(name: 'category_image') this.categoryImage,
      @JsonKey(name: 'video_id') this.videoId});

  factory _$_Anime.fromJson(Map<String, dynamic> json) =>
      _$$_AnimeFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  @JsonKey(name: 'category_image')
  final String? categoryImage;
  @override
  @JsonKey(name: 'video_id')
  final String? videoId;

  @override
  String toString() {
    return 'Anime(id: $id, title: $title, categoryId: $categoryId, categoryName: $categoryName, categoryImage: $categoryImage, videoId: $videoId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Anime &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryImage, categoryImage) ||
                other.categoryImage == categoryImage) &&
            (identical(other.videoId, videoId) || other.videoId == videoId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, categoryId, categoryName, categoryImage, videoId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimeCopyWith<_$_Anime> get copyWith =>
      __$$_AnimeCopyWithImpl<_$_Anime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnimeToJson(
      this,
    );
  }
}

abstract class _Anime implements Anime {
  const factory _Anime(
      {final String? id,
      final String? title,
      @JsonKey(name: 'category_id') final String? categoryId,
      @JsonKey(name: 'category_name') final String? categoryName,
      @JsonKey(name: 'category_image') final String? categoryImage,
      @JsonKey(name: 'video_id') final String? videoId}) = _$_Anime;

  factory _Anime.fromJson(Map<String, dynamic> json) = _$_Anime.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  @JsonKey(name: 'category_id')
  String? get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @JsonKey(name: 'category_image')
  String? get categoryImage;
  @override
  @JsonKey(name: 'video_id')
  String? get videoId;
  @override
  @JsonKey(ignore: true)
  _$$_AnimeCopyWith<_$_Anime> get copyWith =>
      throw _privateConstructorUsedError;
}

Stream _$StreamFromJson(Map<String, dynamic> json) {
  return _Stream.fromJson(json);
}

/// @nodoc
mixin _$Stream {
  @JsonKey(name: 'video_id')
  String? get videoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String? get categoryId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get locationsd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StreamCopyWith<Stream> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamCopyWith<$Res> {
  factory $StreamCopyWith(Stream value, $Res Function(Stream) then) =
      _$StreamCopyWithImpl<$Res, Stream>;
  @useResult
  $Res call(
      {@JsonKey(name: 'video_id') String? videoId,
      @JsonKey(name: 'category_id') String? categoryId,
      String? title,
      String? location,
      String? locationsd});
}

/// @nodoc
class _$StreamCopyWithImpl<$Res, $Val extends Stream>
    implements $StreamCopyWith<$Res> {
  _$StreamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = freezed,
    Object? categoryId = freezed,
    Object? title = freezed,
    Object? location = freezed,
    Object? locationsd = freezed,
  }) {
    return _then(_value.copyWith(
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      locationsd: freezed == locationsd
          ? _value.locationsd
          : locationsd // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StreamCopyWith<$Res> implements $StreamCopyWith<$Res> {
  factory _$$_StreamCopyWith(_$_Stream value, $Res Function(_$_Stream) then) =
      __$$_StreamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'video_id') String? videoId,
      @JsonKey(name: 'category_id') String? categoryId,
      String? title,
      String? location,
      String? locationsd});
}

/// @nodoc
class __$$_StreamCopyWithImpl<$Res>
    extends _$StreamCopyWithImpl<$Res, _$_Stream>
    implements _$$_StreamCopyWith<$Res> {
  __$$_StreamCopyWithImpl(_$_Stream _value, $Res Function(_$_Stream) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = freezed,
    Object? categoryId = freezed,
    Object? title = freezed,
    Object? location = freezed,
    Object? locationsd = freezed,
  }) {
    return _then(_$_Stream(
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      locationsd: freezed == locationsd
          ? _value.locationsd
          : locationsd // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stream implements _Stream {
  const _$_Stream(
      {@JsonKey(name: 'video_id') this.videoId,
      @JsonKey(name: 'category_id') this.categoryId,
      this.title,
      this.location,
      this.locationsd});

  factory _$_Stream.fromJson(Map<String, dynamic> json) =>
      _$$_StreamFromJson(json);

  @override
  @JsonKey(name: 'video_id')
  final String? videoId;
  @override
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @override
  final String? title;
  @override
  final String? location;
  @override
  final String? locationsd;

  @override
  String toString() {
    return 'Stream(videoId: $videoId, categoryId: $categoryId, title: $title, location: $location, locationsd: $locationsd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stream &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.locationsd, locationsd) ||
                other.locationsd == locationsd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, videoId, categoryId, title, location, locationsd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StreamCopyWith<_$_Stream> get copyWith =>
      __$$_StreamCopyWithImpl<_$_Stream>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StreamToJson(
      this,
    );
  }
}

abstract class _Stream implements Stream {
  const factory _Stream(
      {@JsonKey(name: 'video_id') final String? videoId,
      @JsonKey(name: 'category_id') final String? categoryId,
      final String? title,
      final String? location,
      final String? locationsd}) = _$_Stream;

  factory _Stream.fromJson(Map<String, dynamic> json) = _$_Stream.fromJson;

  @override
  @JsonKey(name: 'video_id')
  String? get videoId;
  @override
  @JsonKey(name: 'category_id')
  String? get categoryId;
  @override
  String? get title;
  @override
  String? get location;
  @override
  String? get locationsd;
  @override
  @JsonKey(ignore: true)
  _$$_StreamCopyWith<_$_Stream> get copyWith =>
      throw _privateConstructorUsedError;
}

Detalhes _$DetalhesFromJson(Map<String, dynamic> json) {
  return _Detalhes.fromJson(json);
}

/// @nodoc
mixin _$Detalhes {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_image')
  String? get categoryImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_description')
  String? get categoryDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_genres')
  String? get categoryGenres => throw _privateConstructorUsedError;
  String? get ano => throw _privateConstructorUsedError;
  String? get count => throw _privateConstructorUsedError;
  String? get off => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetalhesCopyWith<Detalhes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetalhesCopyWith<$Res> {
  factory $DetalhesCopyWith(Detalhes value, $Res Function(Detalhes) then) =
      _$DetalhesCopyWithImpl<$Res, Detalhes>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_image') String? categoryImage,
      @JsonKey(name: 'category_description') String? categoryDescription,
      @JsonKey(name: 'category_genres') String? categoryGenres,
      String? ano,
      String? count,
      String? off});
}

/// @nodoc
class _$DetalhesCopyWithImpl<$Res, $Val extends Detalhes>
    implements $DetalhesCopyWith<$Res> {
  _$DetalhesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryName = freezed,
    Object? categoryImage = freezed,
    Object? categoryDescription = freezed,
    Object? categoryGenres = freezed,
    Object? ano = freezed,
    Object? count = freezed,
    Object? off = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImage: freezed == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryDescription: freezed == categoryDescription
          ? _value.categoryDescription
          : categoryDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryGenres: freezed == categoryGenres
          ? _value.categoryGenres
          : categoryGenres // ignore: cast_nullable_to_non_nullable
              as String?,
      ano: freezed == ano
          ? _value.ano
          : ano // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String?,
      off: freezed == off
          ? _value.off
          : off // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetalhesCopyWith<$Res> implements $DetalhesCopyWith<$Res> {
  factory _$$_DetalhesCopyWith(
          _$_Detalhes value, $Res Function(_$_Detalhes) then) =
      __$$_DetalhesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_image') String? categoryImage,
      @JsonKey(name: 'category_description') String? categoryDescription,
      @JsonKey(name: 'category_genres') String? categoryGenres,
      String? ano,
      String? count,
      String? off});
}

/// @nodoc
class __$$_DetalhesCopyWithImpl<$Res>
    extends _$DetalhesCopyWithImpl<$Res, _$_Detalhes>
    implements _$$_DetalhesCopyWith<$Res> {
  __$$_DetalhesCopyWithImpl(
      _$_Detalhes _value, $Res Function(_$_Detalhes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryName = freezed,
    Object? categoryImage = freezed,
    Object? categoryDescription = freezed,
    Object? categoryGenres = freezed,
    Object? ano = freezed,
    Object? count = freezed,
    Object? off = freezed,
  }) {
    return _then(_$_Detalhes(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImage: freezed == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryDescription: freezed == categoryDescription
          ? _value.categoryDescription
          : categoryDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryGenres: freezed == categoryGenres
          ? _value.categoryGenres
          : categoryGenres // ignore: cast_nullable_to_non_nullable
              as String?,
      ano: freezed == ano
          ? _value.ano
          : ano // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String?,
      off: freezed == off
          ? _value.off
          : off // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Detalhes implements _Detalhes {
  const _$_Detalhes(
      {this.id,
      @JsonKey(name: 'category_name') this.categoryName,
      @JsonKey(name: 'category_image') this.categoryImage,
      @JsonKey(name: 'category_description') this.categoryDescription,
      @JsonKey(name: 'category_genres') this.categoryGenres,
      this.ano,
      this.count,
      this.off});

  factory _$_Detalhes.fromJson(Map<String, dynamic> json) =>
      _$$_DetalhesFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  @JsonKey(name: 'category_image')
  final String? categoryImage;
  @override
  @JsonKey(name: 'category_description')
  final String? categoryDescription;
  @override
  @JsonKey(name: 'category_genres')
  final String? categoryGenres;
  @override
  final String? ano;
  @override
  final String? count;
  @override
  final String? off;

  @override
  String toString() {
    return 'Detalhes(id: $id, categoryName: $categoryName, categoryImage: $categoryImage, categoryDescription: $categoryDescription, categoryGenres: $categoryGenres, ano: $ano, count: $count, off: $off)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Detalhes &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryImage, categoryImage) ||
                other.categoryImage == categoryImage) &&
            (identical(other.categoryDescription, categoryDescription) ||
                other.categoryDescription == categoryDescription) &&
            (identical(other.categoryGenres, categoryGenres) ||
                other.categoryGenres == categoryGenres) &&
            (identical(other.ano, ano) || other.ano == ano) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.off, off) || other.off == off));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryName, categoryImage,
      categoryDescription, categoryGenres, ano, count, off);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetalhesCopyWith<_$_Detalhes> get copyWith =>
      __$$_DetalhesCopyWithImpl<_$_Detalhes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetalhesToJson(
      this,
    );
  }
}

abstract class _Detalhes implements Detalhes {
  const factory _Detalhes(
      {final String? id,
      @JsonKey(name: 'category_name') final String? categoryName,
      @JsonKey(name: 'category_image') final String? categoryImage,
      @JsonKey(name: 'category_description') final String? categoryDescription,
      @JsonKey(name: 'category_genres') final String? categoryGenres,
      final String? ano,
      final String? count,
      final String? off}) = _$_Detalhes;

  factory _Detalhes.fromJson(Map<String, dynamic> json) = _$_Detalhes.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @JsonKey(name: 'category_image')
  String? get categoryImage;
  @override
  @JsonKey(name: 'category_description')
  String? get categoryDescription;
  @override
  @JsonKey(name: 'category_genres')
  String? get categoryGenres;
  @override
  String? get ano;
  @override
  String? get count;
  @override
  String? get off;
  @override
  @JsonKey(ignore: true)
  _$$_DetalhesCopyWith<_$_Detalhes> get copyWith =>
      throw _privateConstructorUsedError;
}
