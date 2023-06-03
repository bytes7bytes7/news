import 'package:flutter/material.dart';

import '../../../common/presentation/widgets/widgets.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

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
            ArticleList(
              articles: [],
            ),
            ArticleList(
              articles: [],
            ),
          ],
        ),
      ),
    );
  }
}
