import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:full_app_cinemapedia/presentation/widgets/widgets.dart';
import 'package:full_app_cinemapedia/presentation/providers/providers.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final upcomingMovies = ref.watch(upComingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    final initialLoading = ref.watch(initialLoadingProvider);

    return initialLoading
        ? const FullScreenLoader()
        : CustomScrollView(
            slivers: [
              const SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  title: CustomAppbar(),
                ),
                floating: true,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: [
                    MoviesSlideshow(movies: slideShowMovies),
                    MoviesHorizontalListview(
                      movies: nowPlayingMovies,
                      title: 'En cines',
                      subTitle: 'Lunes 20',
                      loadNextPage: () {
                        ref
                            .read(nowPlayingMoviesProvider.notifier)
                            .loadNextPage();
                      },
                    ),
                    MoviesHorizontalListview(
                      movies: upcomingMovies,
                      title: 'Próximamente',
                      subTitle: 'En este mes',
                      loadNextPage: () {
                        ref
                            .read(upComingMoviesProvider.notifier)
                            .loadNextPage();
                      },
                    ),
                    MoviesHorizontalListview(
                      movies: popularMovies,
                      title: 'Populares',
                      subTitle: 'En este mes',
                      loadNextPage: () {
                        ref.read(popularMoviesProvider.notifier).loadNextPage();
                      },
                    ),
                    MoviesHorizontalListview(
                      movies: topRatedMovies,
                      title: 'Top Rated',
                      subTitle: 'En este mes',
                      loadNextPage: () {
                        ref
                            .read(topRatedMoviesProvider.notifier)
                            .loadNextPage();
                      },
                    ),
                  ],
                );
              }, childCount: 1))
            ],
          );
  }
}
