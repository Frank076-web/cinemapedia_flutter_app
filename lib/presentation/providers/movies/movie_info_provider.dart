import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_app_cinemapedia/domain/domain.dart';
import 'package:full_app_cinemapedia/presentation/providers/providers.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final getMovieByIdFn = ref.watch(movieRepositoryProvider).getMovieById;

  return MovieMapNotifier(getMovieCallBack: getMovieByIdFn);
});

typedef GetMovieCallBack = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallBack getMovieCallBack;
  bool isLoading = false;

  MovieMapNotifier({required this.getMovieCallBack}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    isLoading = true;
    final movie = await getMovieCallBack(movieId);

    state = {...state, movieId: movie};

    isLoading = false;
  }
}
