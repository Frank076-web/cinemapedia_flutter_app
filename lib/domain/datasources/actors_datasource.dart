import 'package:full_app_cinemapedia/domain/domain.dart';

abstract class ActorsDatasource {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
