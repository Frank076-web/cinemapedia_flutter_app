import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_app_cinemapedia/domain/domain.dart';
import 'package:full_app_cinemapedia/presentation/providers/providers.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final getActorsByMovieFn =
      ref.watch(actorsRepositoryProvider).getActorsByMovie;

  return ActorsByMovieNotifier(getActorsCallBack: getActorsByMovieFn);
});

typedef GetActorsCallBack = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallBack getActorsCallBack;
  bool isLoading = false;

  ActorsByMovieNotifier({required this.getActorsCallBack}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    isLoading = true;
    final actors = await getActorsCallBack(movieId);

    state = {
      ...state,
      movieId: [...actors]
    };

    isLoading = false;
  }
}
