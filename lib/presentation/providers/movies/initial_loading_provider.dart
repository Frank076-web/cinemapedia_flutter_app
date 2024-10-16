import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_app_cinemapedia/presentation/providers/providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(moviesSlideshowProvider).isEmpty;
  final step2 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step3 = ref.watch(upComingMoviesProvider).isEmpty;
  final step4 = ref.watch(popularMoviesProvider).isEmpty;
  final step5 = ref.watch(topRatedMoviesProvider).isEmpty;

  return step1 || step2 || step3 || step4 || step5;
});
