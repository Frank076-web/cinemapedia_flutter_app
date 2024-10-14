import 'package:full_app_cinemapedia/domain/domain.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
