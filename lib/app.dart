import 'package:flutter/material.dart';

import 'top_new_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'News',
      home: TopNewsScreen(),
    );
  }
}
