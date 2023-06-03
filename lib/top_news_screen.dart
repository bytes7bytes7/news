import 'package:flutter/material.dart';

import 'news_card.dart';

class TopNewsScreen extends StatelessWidget {
  const TopNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: 100,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            return const NewsCard();
          },
        ),
      ),
    );
  }
}

