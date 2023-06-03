part of 'top_news_bloc.dart';

class TopNewsState extends Equatable {
  const TopNewsState({
    this.isLoading = false,
    this.error = '',
    this.articles = const [],
  });

  final bool isLoading;
  final String error;
  final List<ArticleVM> articles;

  TopNewsState withLoading() => copyWith(isLoading: true);

  TopNewsState withoutLoading() => copyWith(isLoading: false);

  TopNewsState withError(String error) => copyWith(
        isLoading: false,
        error: error,
      );

  TopNewsState copyWith({
    bool? isLoading,
    String? error = '',
    List<ArticleVM>? articles,
  }) {
    return TopNewsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        articles,
      ];
}
