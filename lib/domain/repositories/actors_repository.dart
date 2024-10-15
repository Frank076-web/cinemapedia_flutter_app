import 'package:full_app_cinemapedia/domain/domain.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
