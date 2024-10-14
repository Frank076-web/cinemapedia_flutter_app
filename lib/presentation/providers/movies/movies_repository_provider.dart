import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_app_cinemapedia/infrastructure/infrastructure.dart';

//Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(TheMoviedbDatasourceImpl());
});
