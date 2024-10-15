import 'package:full_app_cinemapedia/domain/domain.dart';

class ActorMoviedbRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;

  ActorMoviedbRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
