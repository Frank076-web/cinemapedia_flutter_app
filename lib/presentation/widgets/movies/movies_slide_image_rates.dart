import 'package:flutter/material.dart';
import 'package:full_app_cinemapedia/config/config.dart';

class MoviesSlideImageRates extends StatelessWidget {
  final double voteAverage;
  final double popularity;

  const MoviesSlideImageRates(
      {super.key, required this.voteAverage, required this.popularity});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return SizedBox(
      width: 140,
      child: Row(
        children: [
          Icon(
            Icons.star_half_outlined,
            color: Colors.yellow.shade800,
          ),
          const SizedBox(width: 5),
          Text(
            '$voteAverage',
            style:
                textStyles.bodyMedium?.copyWith(color: Colors.yellow.shade800),
          ),
          const Spacer(),
          Text(
            HumanFormats.number(popularity),
            style: textStyles.bodySmall,
          )
        ],
      ),
    );
  }
}
