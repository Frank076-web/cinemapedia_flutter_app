import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:full_app_cinemapedia/presentation/providers/providers.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie_screen';

  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final movieInfo = ref.watch(movieInfoProvider)[widget.movieId];
    final isLoading = ref.watch(movieInfoProvider.notifier).isLoading;

    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Text('MovieID: ${movieInfo?.id}'),
      ),
    );
  }
}
