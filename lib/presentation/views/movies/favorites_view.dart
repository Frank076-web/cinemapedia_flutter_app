import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:full_app_cinemapedia/domain/domain.dart';
import 'package:full_app_cinemapedia/presentation/providers/providers.dart';
import 'package:full_app_cinemapedia/presentation/widgets/widgets.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLoading = false;
  bool isLastPage = false;

  void loadNextPage() async {
    if (isLoading || isLastPage) return;

    isLoading = true;
    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  void initState() {
    super.initState();
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final List<Movie> movies =
        ref.watch(favoriteMoviesProvider).values.toList();

    if (movies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline_sharp,
              size: 60,
              color: colors.primary,
            ),
            Text(
              'Aún no hay favoritos',
              style: TextStyle(fontSize: 30, color: colors.primary),
            )
          ],
        ),
      );
    }

    return MovieMasonry(
      movies: movies,
      loadNextPage: loadNextPage,
    );
  }
}
