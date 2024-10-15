import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_app_cinemapedia/infrastructure/infrastructure.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorMoviedbRepositoryImpl(ActorMoviedbDatasourceImpl());
});
