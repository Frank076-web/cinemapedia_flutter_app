import 'package:dio/dio.dart';

import 'package:full_app_cinemapedia/config/constants/constants.dart';
import 'package:full_app_cinemapedia/domain/domain.dart';
import 'package:full_app_cinemapedia/infrastructure/mappers/mappers.dart';
import 'package:full_app_cinemapedia/infrastructure/models/models.dart';

class ActorMoviedbDatasourceImpl extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'en-AR'
      }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    return CreditsResponse.fromJson(response.data)
        .cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
  }
}
