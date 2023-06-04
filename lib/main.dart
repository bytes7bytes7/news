import 'package:flutter/material.dart';

import 'app.dart';
import 'main/infrastructure/injector/injector.dart';

Future<void> main() async {
  await configInjector();

  runApp(const App());
}
