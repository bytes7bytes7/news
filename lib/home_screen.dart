import 'package:flutter/material.dart';

import 'news_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'News',
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Top',
              ),
              Tab(
                text: 'All',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NewsList(),
            NewsList(),
          ],
        ),
      ),
    );
  }
}
