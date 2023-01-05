// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_interfaces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Episodio _$$_EpisodioFromJson(Map<String, dynamic> json) => _$_Episodio(
      videoId: json['video_id'] as String?,
      categoryId: json['category_id'] as String?,
      title: json['title'] as String?,
      categoryImage: json['category_image'] as String?,
    );

Map<String, dynamic> _$$_EpisodioToJson(_$_Episodio instance) =>
    <String, dynamic>{
      'video_id': instance.videoId,
      'category_id': instance.categoryId,
      'title': instance.title,
      'category_image': instance.categoryImage,
    };

_$_Anime _$$_AnimeFromJson(Map<String, dynamic> json) => _$_Anime(
      id: json['id'] as String?,
      title: json['title'] as String?,
      categoryId: json['category_id'] as String?,
      categoryName: json['category_name'] as String?,
      categoryImage: json['category_image'] as String?,
      videoId: json['video_id'] as String?,
    );

Map<String, dynamic> _$$_AnimeToJson(_$_Anime instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_image': instance.categoryImage,
      'video_id': instance.videoId,
    };

_$_Stream _$$_StreamFromJson(Map<String, dynamic> json) => _$_Stream(
      videoId: json['video_id'] as String?,
      categoryId: json['category_id'] as String?,
      title: json['title'] as String?,
      location: json['location'] as String?,
      locationsd: json['locationsd'] as String?,
    );

Map<String, dynamic> _$$_StreamToJson(_$_Stream instance) => <String, dynamic>{
      'video_id': instance.videoId,
      'category_id': instance.categoryId,
      'title': instance.title,
      'location': instance.location,
      'locationsd': instance.locationsd,
    };

_$_Detalhes _$$_DetalhesFromJson(Map<String, dynamic> json) => _$_Detalhes(
      id: json['id'] as String?,
      categoryName: json['category_name'] as String?,
      categoryImage: json['category_image'] as String?,
      categoryDescription: json['category_description'] as String?,
      categoryGenres: json['category_genres'] as String?,
      ano: json['ano'] as String?,
      count: json['count'] as String?,
      off: json['off'] as String?,
    );

Map<String, dynamic> _$$_DetalhesToJson(_$_Detalhes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_name': instance.categoryName,
      'category_image': instance.categoryImage,
      'category_description': instance.categoryDescription,
      'category_genres': instance.categoryGenres,
      'ano': instance.ano,
      'count': instance.count,
      'off': instance.off,
    };
