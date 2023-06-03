import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}