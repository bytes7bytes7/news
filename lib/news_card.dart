import 'package:flutter/material.dart';

const _isFavourite = false;

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('single tap');
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
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Expanded(
                      child: Text(
                        'Facebook preparing new app to'
                        ' maintain pressure on Snapchat'
                        'asd assdasad s adsdaasd',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      '1m ago',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
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
