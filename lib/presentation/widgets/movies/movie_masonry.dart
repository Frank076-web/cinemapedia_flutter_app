import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:full_app_cinemapedia/domain/domain.dart';
import 'package:full_app_cinemapedia/presentation/widgets/widgets.dart';

class MovieMasonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MovieMasonry({
    super.key,
    this.loadNextPage,
    required this.movies,
  });

  @override
  State<MovieMasonry> createState() => MovieMasonryState();
}

class MovieMasonryState extends State<MovieMasonry> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (widget.loadNextPage == null) return;

      if (controller.position.pixels > controller.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(height: 40),
                MoviePosterLink(movie: widget.movies[index])
              ],
            );
          }

          return MoviePosterLink(movie: widget.movies[index]);
        },
      ),
    );
  }
}
