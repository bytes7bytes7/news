import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'main/main.dart';
import 'themes/themes.dart';
import 'utils/typedef.dart';

final _getIt = GetIt.instance;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _getIt.get<NavigatorKey>(),
      title: 'News',
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}
