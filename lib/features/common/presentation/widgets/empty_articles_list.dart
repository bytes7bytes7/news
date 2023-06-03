import 'package:flutter/material.dart';

class EmptyArticlesList extends StatelessWidget {
  const EmptyArticlesList({
    super.key,
    required this.onRefresh,
  });

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh,
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 40,
        ),
        child: Text(
          'No articles',
        ),
      ),
    );
  }
}
