import 'package:flutter/material.dart';

import 'article_screen.dart';

const _isFavourite = false;

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const ArticleScreen();
            },
          ),
        );
      },
      onDoubleTap: () {
        print('double tap');
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (_isFavourite)
                          const SizedBox.shrink()
                        else
                          Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                            ],
                          ),
                        Text(
                          'The New York Times',
                          style: theme.textTheme.labelSmall,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Facebook preparing new app to'
                        ' maintain pressure on Snapchat'
                        'asd assdasad s adsdaasd',
                        style: theme.textTheme.headlineSmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '1m ago',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox.square(
              dimension: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://imgv3.fotor.com/images/'
                      'blog-cover-image/part-blurry-image.jpg',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
