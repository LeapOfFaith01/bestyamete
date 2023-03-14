import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_interfaces.freezed.dart';
part 'api_interfaces.g.dart';

/// Classe referente a informações de Episódios.
/// videoId: ID do episódio para streaming
/// categoryId: Id do anime usado para buscar todos os episódios
/// categoryImage: Id da capa do anime ou episodio
///
@freezed
class Episodio with _$Episodio {
  const factory Episodio(
      {@JsonKey(name: 'video_id') String? videoId,
      @JsonKey(name: 'category_id') String? categoryId,
      String? title,
      @JsonKey(name: 'category_image') String? categoryImage}) = _Episodio;

  factory Episodio.fromJson(Map<String, dynamic> json) =>
      _$EpisodioFromJson(json);
}

/// Modelo referente a Listagem de episódios
/// ID: Refere-se a identificação do anime
/// category_name: Referece ao nome do anime
/// category_image: Referece a imagem de capa do anime
/// videoId: ID do episódio para streaming
///
@freezed
class Anime with _$Anime {
  const factory Anime(
      {String? id,
      String? title,
      @JsonKey(name: 'category_id') String? categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_image') String? categoryImage,
      @JsonKey(name: 'video_id') String? videoId}) = _Anime;

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);
}

/// Modelo referente a Streaming
/// videoId: ID do episódio para streaming
/// categoryId: Id do anime
/// title: Nome do episodio
/// location: Url de streaming em qualidade normal
/// locationsd: Url de streaming em qualidade HD
@freezed
class Stream with _$Stream {
  const factory Stream(
      {@JsonKey(name: 'video_id') String? videoId,
      @JsonKey(name: 'category_id') String? categoryId,
      String? title,
      String? location,
      String? locationsd}) = _Stream;
  factory Stream.fromJson(Map<String, dynamic> json) => _$StreamFromJson(json);
}

///id: ID do anime
// category_name: título/nome do anime
// category_image: nome único da imagem da capa do anime (pode retornar 404, a API é inconsistente)
// category_description: a sinopse do anime
// category_genres: os gêneros do anime separado por vírgula dentro de uma string
// ano: ano do anime
// count: ???????
// off: ???????
@freezed
class Detalhes with _$Detalhes {
  const factory Detalhes(
      {String? id,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'category_image') String? categoryImage,
      @JsonKey(name: 'category_description') String? categoryDescription,
      @JsonKey(name: 'category_genres') String? categoryGenres,
      String? ano,
      String? count,
      String? off}) = _Detalhes;

  factory Detalhes.fromJson(Map<String, dynamic> json) =>
      _$DetalhesFromJson(json);
}
