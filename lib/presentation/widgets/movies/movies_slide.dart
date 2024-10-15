import 'package:flutter/material.dart';

import 'package:full_app_cinemapedia/domain/domain.dart';
import 'package:full_app_cinemapedia/presentation/widgets/widgets.dart';

class MoviesSlide extends StatelessWidget {
  final Movie movie;

  const MoviesSlide({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviesSlideImage(movie: movie),
          const SizedBox(height: 5),
          MoviesSlideImageTitle(title: movie.title),
          MoviesSlideImageRates(
            voteAverage: movie.voteAverage,
            popularity: movie.popularity,
          ),
        ],
      ),
    );
  }
}
