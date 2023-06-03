import 'package:freezed_annotation/freezed_annotation.dart';

import '../source_vm/source_vm.dart';

part 'article_vm.freezed.dart';

@freezed
class ArticleVM with _$ArticleVM {
  const factory ArticleVM({
    required SourceVM source,
    required String? author,
    required String title,
    required String? description,
    required String url,
    required String? imageUrl,
    required String publishedAtShort,
    required String publishedAtFull,
    required String content,
    required bool isFavourite,
  }) = _ArticleVM;
}
