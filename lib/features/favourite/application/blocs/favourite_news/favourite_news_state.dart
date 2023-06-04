part of 'favourite_news_bloc.dart';

class FavouriteNewsState extends Equatable {
  const FavouriteNewsState({
    this.isLoading = false,
    this.isLoadingMore = false,
    this.canLoadMore = true,
    this.error = '',
    this.lastArticleID,
    this.articles = const [],
  });

  final bool isLoading;
  final bool isLoadingMore;
  final bool canLoadMore;
  final String error;
  final String? lastArticleID;
  final List<ArticleVM> articles;

  bool get hasError => error.isNotEmpty;

  FavouriteNewsState withLoading() => copyWith(isLoading: true);

  FavouriteNewsState withoutLoading() => copyWith(isLoading: false);

  FavouriteNewsState withError(String error) => copyWith(
        isLoading: false,
        error: error,
      );

  FavouriteNewsState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? canLoadMore,
    String? error = '',
    String? lastArticleID,
    List<ArticleVM>? articles,
  }) {
    return FavouriteNewsState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
      lastArticleID: lastArticleID ?? this.lastArticleID,
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isLoadingMore,
        canLoadMore,
        error,
        lastArticleID,
        articles,
      ];
}
