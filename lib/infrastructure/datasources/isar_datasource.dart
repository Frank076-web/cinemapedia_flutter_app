import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:full_app_cinemapedia/domain/domain.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema],
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }

  Future<List<Movie>> _findAllMovies({int limit = 10, int page = 0}) async {
    final isar = await db;
    return await isar.movies.where().offset(page).limit(limit).findAll();
  }

  Future<Movie?> _findMovieById(int id) async {
    final isar = await db;
    return await isar.movies.filter().idEqualTo(id).findFirst();
  }

  Future<void> _writeMovie(Movie movie) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }

  Future<void> _deleteMovie(Id isarId) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.movies.deleteSync(isarId));
  }

  //Exposed Methods
  @override
  Future<bool> isMovieFavorite(Movie movie) async =>
      await _findMovieById(movie.id) != null;

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) async =>
      _findAllMovies(limit: limit, page: offset);

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final favoriteMovie = await isMovieFavorite(movie);

    if (favoriteMovie == true) {
      final isarMovie = await _findMovieById(movie.id);
      _deleteMovie(isarMovie!.isarId);
      return;
    }

    _writeMovie(movie);
  }
}
