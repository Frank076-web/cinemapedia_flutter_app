import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:full_app_cinemapedia/infrastructure/infrastructure.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
