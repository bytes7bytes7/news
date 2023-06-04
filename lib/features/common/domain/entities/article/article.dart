import 'package:freezed_annotation/freezed_annotation.dart';

import '../../value_objects/article_id.dart';

part 'article.freezed.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required ArticleID id,
    required String sourceName,
    required String? author,
    required String title,
    required String? description,
    required String url,
    required String? imageUrl,
    required DateTime publishedAt,
    required String publishedAtUtc,
    required String? content,
    required bool isFavourite,
  }) = _Article;
}
