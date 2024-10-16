import 'package:flutter/material.dart';

import 'package:full_app_cinemapedia/presentation/views/views.dart';
import 'package:full_app_cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  final List<Widget> viewRoutes = const [
    HomeView(),
    SizedBox(),
    FavoritesView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationbar(currentIndex: pageIndex),
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
    );
  }
}
