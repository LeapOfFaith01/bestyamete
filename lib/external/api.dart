import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:bestyamete/models/api_interfaces.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../utils/helpers.dart';
import 'package:dio/dio.dart';
class Api{
  _normalize(Uint8List data) => utf8.decode(data, allowMalformed: true);
  Future<List<Anime>> obterEpisodiosRecentes() async{
    var url = Uri(
      scheme: 'https',
      host: 'appanimeplus.tk',
      path: 'play-api.php',
      query: 'latest'
    );
    var response = await http.get(url,headers: DataHelpers.baseHeaders,);
    //Formata o corpo semi gzip para utf8
    var normalized = _normalize(response.bodyBytes);

    Iterable parsed = await json.decode(normalized);

    return List<Anime>.from(parsed.map((e) => Anime.fromJson(e)));
  }

  Future<List<Anime>> obterAnimesPorCategoria(String category) async{
    var url = Uri(
      scheme: DataHelpers.baseScheme,
      host:DataHelpers.baseHost,
      path: DataHelpers.basePath,
      queryParameters: {
        DataHelpers.categoryQuery:category
      }
    );

    var response = await http.get(url,headers: DataHelpers.baseHeaders,);
    //Formata o corpo semi gzip para utf8
    var normalized = _normalize(response.bodyBytes);

    Iterable parsed = await json.decode(normalized);

    return List<Anime>.from(parsed.map((e) => Anime.fromJson(e)));
  }

  Future<List<Anime>> obterAnimesPorLetra(String letter) async{
    var url = Uri(
        scheme: DataHelpers.baseScheme,
        host:DataHelpers.baseHost,
        path: DataHelpers.basePath,
        queryParameters: {
          DataHelpers.letterQuery : letter
        }
    );

    var response = await http.get(url,headers: DataHelpers.baseHeaders,);
    //Formata o corpo semi gzip para utf8
    var normalized = _normalize(response.bodyBytes);

    Iterable parsed = await json.decode(normalized);

    return List<Anime>.from(parsed.map((e) => Anime.fromJson(e)));
  }

  Future<List<Anime>> obterListaDeEpisodios(String id) async{
    var url = Uri(
        scheme: DataHelpers.baseScheme,
        host:DataHelpers.baseHost,
        path: DataHelpers.basePath,
        queryParameters: {
          DataHelpers.episodeQuery : id
        }
    );

    var response = await http.get(url,headers: DataHelpers.baseHeaders,);
    //Formata o corpo semi gzip para utf8
    var normalized = _normalize(response.bodyBytes);

    Iterable parsed = await json.decode(normalized);

    return List<Anime>.from(parsed.map((e) => Anime.fromJson(e)));
  }

  Future<List<Stream>> obterDadosDeStreaming(String id) async{
    var url = Uri(
        scheme: DataHelpers.baseScheme,
        host:DataHelpers.baseHost,
        path: DataHelpers.basePath,
        queryParameters: {
          DataHelpers.streamQuery : id
        }
    );

    var response = await http.get(url,headers: DataHelpers.baseHeaders,);
    //Formata o corpo semi gzip para utf8
    var normalized = _normalize(response.bodyBytes);

    Iterable parsed = await json.decode(normalized);

    return List<Stream>.from(parsed.map((e) => Stream.fromJson(e)));
  }

  Future<List<Anime>> obterAnimesPorNome(String name) async{
    var url = Uri(
        scheme: DataHelpers.baseScheme,
        host:DataHelpers.baseHost,
        path: DataHelpers.basePath,
        queryParameters: {
          DataHelpers.searchQuery : name
        }
    );

    var response = await http.get(url,headers: DataHelpers.baseHeaders,);
    //Formata o corpo semi gzip para utf8
    var normalized = _normalize(response.bodyBytes);

    Iterable parsed = await json.decode(normalized);

    return List<Anime>.from(parsed.map((e) => Anime.fromJson(e)));
  }

  Future<List<Detalhes>> obterDetalhes(String id) async{
    var url = Uri(
        scheme: DataHelpers.baseScheme,
        host:DataHelpers.baseHost,
        path: DataHelpers.basePath,
        queryParameters: {
          DataHelpers.detailQuery : id
        }
    );

    var response = await http.get(url,headers: DataHelpers.baseHeaders,);
    //Formata o corpo semi gzip para utf8
    var normalized = _normalize(response.bodyBytes);

    Iterable parsed = await json.decode(normalized);

    return List<Detalhes>.from(parsed.map((e) => Detalhes.fromJson(e)));
  }

  Future<List<Anime>> obterAnimesPopulares() async{
    var url = Uri(
        scheme: DataHelpers.baseScheme,
        host:DataHelpers.baseHost,
        path: DataHelpers.basePath,
        query: DataHelpers.popularQuery
    );
    var response = await http.get(url,headers: DataHelpers.baseHeaders,);
    //Formata o corpo semi gzip para utf8
    var normalized = _normalize(response.bodyBytes);

    Iterable parsed = await json.decode(normalized);

    return List<Anime>.from(parsed.map((e) => Anime.fromJson(e)));
  }

  Future<List<Stream>> obterDadosStreamingProximoEpisodio(String id, String animeId) async{
    var url = Uri(
        scheme: DataHelpers.baseScheme,
        host:DataHelpers.baseHost,
        path: DataHelpers.basePath,
        queryParameters: {
          DataHelpers.streamQuery : id,
          DataHelpers.nextEpisodeQuery: animeId,
          DataHelpers.nextEpisodePrefixQuery:''
        }
    );

    var response = await http.get(url,headers: DataHelpers.baseHeaders,);


    //Formata o corpo semi gzip para utf8
    var normalized = _normalize(response.bodyBytes);
    developer.log(normalized);
    if(normalized=='null') return [];

    Iterable parsed = await json.decode(normalized);

    return List<Stream>.from(parsed.map((e) => Stream.fromJson(e)));
  }


}