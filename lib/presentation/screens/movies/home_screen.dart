import 'package:flutter/material.dart';

import 'package:full_app_cinemapedia/config/config.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Text(Environment.movieDbKey),
      ),
    );
  }
}
