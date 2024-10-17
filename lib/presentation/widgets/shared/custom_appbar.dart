import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:full_app_cinemapedia/domain/domain.dart';
import 'package:full_app_cinemapedia/presentation/providers/providers.dart';
import 'package:full_app_cinemapedia/presentation/delegates/delegates.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text('Cinemapedia', style: titleStyle),
              const Spacer(),
              IconButton(
                onPressed: () async {
                  final searchQuery = ref.read(searchQueryProvider);

                  final movie = await showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMovieDelegate(
                        initialMovies: ref.read(searchedMoviesProvider),
                        searchMovies: ref
                            .read(searchedMoviesProvider.notifier)
                            .searchMoviesByQuery),
                  );

                  if (movie != null && context.mounted) {
                    context.push('/home/0/movie/${movie.id}');
                  }
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
        ),
      ),
    );
  }
}
