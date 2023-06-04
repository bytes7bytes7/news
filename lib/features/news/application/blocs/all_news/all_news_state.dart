part of 'all_news_bloc.dart';

class AllNewsState extends Equatable {
  const AllNewsState({
    this.isLoading = false,
    this.isLoadingMore = false,
    this.canLoadMore = true,
    this.error = '',
    this.page = 1,
    this.articles = const [],
  });

  final bool isLoading;
  final bool isLoadingMore;
  final bool canLoadMore;
  final String error;
  final int page;
  final List<ArticleVM> articles;

  bool get hasError => error.isNotEmpty;

  AllNewsState withLoading() => copyWith(isLoading: true);

  AllNewsState withoutLoading() => copyWith(isLoading: false);

  AllNewsState withError(String error) => copyWith(
        isLoading: false,
        error: error,
      );

  AllNewsState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? canLoadMore,
    String? error = '',
    int? page,
    List<ArticleVM>? articles,
  }) {
    return AllNewsState(
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
