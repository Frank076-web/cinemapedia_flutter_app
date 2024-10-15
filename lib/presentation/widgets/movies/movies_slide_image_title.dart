import 'package:flutter/material.dart';

class MoviesSlideImageTitle extends StatelessWidget {
  final String title;

  const MoviesSlideImageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return SizedBox(
      width: 150,
      child: Text(
        title,
        maxLines: 2,
        style: textStyles.titleSmall,
      ),
    );
  }
}
