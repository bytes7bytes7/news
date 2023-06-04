import 'package:hive/hive.dart';

part 'article_entity.g.dart';

@HiveType(typeId: 0)
class ArticleEntity extends HiveObject {
  ArticleEntity({
    required this.id,
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.content,
    required this.isFavourite,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String sourceName;

  @HiveField(2)
  final String? author;

  @HiveField(3)
  final String title;

  @HiveField(4)
  final String? description;

  @HiveField(5)
  final String url;

  @HiveField(6)
  final String? imageUrl;

  @HiveField(7)
  final String publishedAt;

  @HiveField(8)
  final String? content;

  @HiveField(9)
  final bool isFavourite;
}
