import 'package:full_app_cinemapedia/domain/domain.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavorite(Movie movie);

  Future<bool> isMovieFavorite(Movie movie);

  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0});
}
