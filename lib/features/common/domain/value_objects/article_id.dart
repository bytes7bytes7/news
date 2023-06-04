import 'package:equatable/equatable.dart';

class ArticleID extends Equatable {
  factory ArticleID({
    required String sourceName,
    required String publishedAt,
  }) {
    return ArticleID._('$sourceName $publishedAt');
  }

  factory ArticleID.fromString(String value) => ArticleID._(value);

  const ArticleID._(this.value);

  final String value;

  @override
  List<Object?> get props => [value];
}
