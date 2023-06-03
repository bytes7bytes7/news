import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text('News'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saturday 29 Nov 2019',
                  style: theme.textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'How to redesign a 175-year-old newspaper',
                  style: theme.textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox.fromSize(
                  size: const Size.fromHeight(200),
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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'All new Tesla Model 3 vehicles will now qualify for '
                  'the full \$7,500 federal EV tax credit, according to a '
                  'change in Tesla’s website.\r\nThe EV tax credits were '
                  'mandated by Congress last August as part',
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
