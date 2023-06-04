part of 'top_news_bloc.dart';

class TopNewsState extends Equatable {
  const TopNewsState({
    this.isLoading = false,
    this.isLoadingMore = false,
    this.canLoadMore = true,
    this.error = '',
    this.page = 0,
    this.articles = const [],
  });

  final bool isLoading;
  final bool isLoadingMore;
  final bool canLoadMore;
  final String error;
  final int page;
  final List<ArticleVM> articles;

  bool get hasError => error.isNotEmpty;

  TopNewsState withLoading() => copyWith(isLoading: true);

  TopNewsState withoutLoading() => copyWith(isLoading: false);

  TopNewsState withError(String error) => copyWith(
        isLoading: false,
        error: error,
      );

  TopNewsState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? canLoadMore,
    String? error = '',
    int? page,
    List<ArticleVM>? articles,
  }) {
    return TopNewsState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
      page: page ?? this.page,
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isLoadingMore,
        canLoadMore,
        error,
        page,
        articles,
      ];
}
