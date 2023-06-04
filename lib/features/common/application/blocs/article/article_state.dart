part of 'article_bloc.dart';

class ArticleState extends Equatable {
  const ArticleState({
    this.isLoading = false,
    this.error = '',
    this.articleID,
    this.article,
  });

  final bool isLoading;
  final String error;
  final String? articleID;
  final ArticleVM? article;

  bool get hasError => error.isNotEmpty;

  ArticleState withLoading() => copyWith(isLoading: true);

  ArticleState withoutLoading() => copyWith(isLoading: false);

  ArticleState withError(String error) => copyWith(
        isLoading: false,
        error: error,
      );

  ArticleState copyWith({
    bool? isLoading,
    String? error = '',
    String? articleID,
    ArticleVM? article,
  }) {
    return ArticleState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      articleID: articleID ?? this.articleID,
      article: article ?? this.article,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        articleID,
        article,
      ];
}
