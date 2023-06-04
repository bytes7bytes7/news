import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../application/view_models/view_models.dart';

const _height = 100.0;

class ArticleCard extends StatelessWidget {
  const ArticleCard({
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

    final imageUrlOrNull = article.imageUrl;

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
                          )
                        else
                          const SizedBox.shrink(),
                        Text(
                          article.sourceName,
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      article.publishedAtShort,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            if (imageUrlOrNull != null) ...[
              const SizedBox(
                width: 20,
              ),
              SizedBox.square(
                dimension: _height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: imageUrlOrNull,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return ColoredBox(
                        color: theme.unselectedWidgetColor,
                        child: Icon(
                          Icons.warning,
                          color: theme.colorScheme.onBackground,
                        ),
                      );
                    },
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
