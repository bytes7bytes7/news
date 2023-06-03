import 'package:flutter/material.dart';

import '../../application/view_models/view_models.dart';

const _height = 100.0;

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.article,
    required this.onTap,
    required this.onDoubleTap,
  });

  final ArticleVM article;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final imageUrl = article.imageUrl;

    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: _height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (article.isFavourite)
                          const SizedBox.shrink()
                        else
                          Row(
                            children: const [
                              Icon(
                                Icons.favorite,
                                size: 12,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                            ],
                          ),
                        Text(
                          article.source.name,
                          style: theme.textTheme.labelSmall,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Text(
                        article.title,
                        style: theme.textTheme.headlineSmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      article.publishedAt,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            if (imageUrl != null) ...[
              const SizedBox(
                width: 20,
              ),
              SizedBox.square(
                dimension: _height,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        imageUrl,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
