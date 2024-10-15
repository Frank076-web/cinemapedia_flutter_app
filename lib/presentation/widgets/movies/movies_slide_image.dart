import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:full_app_cinemapedia/domain/domain.dart';

class MoviesSlideImage extends StatelessWidget {
  final Movie movie;

  const MoviesSlideImage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          movie.posterPath,
          width: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress != null) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              );
            }

            return FadeIn(child: child);
          },
        ),
      ),
    );
  }
}
