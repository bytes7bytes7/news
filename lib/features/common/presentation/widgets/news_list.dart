import 'package:flutter/material.dart';

import 'news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        itemCount: 100,
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          return const NewsCard();
        },
      ),
    );
  }
}
