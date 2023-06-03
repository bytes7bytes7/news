part of 'all_news_bloc.dart';

class AllNewsState extends Equatable {
  const AllNewsState({
    this.isLoading = false,
    this.error = '',
    this.articles = const [],
  });

  final bool isLoading;
  final String error;
  final List<ArticleVM> articles;

  AllNewsState withLoading() => copyWith(isLoading: true);

  AllNewsState withoutLoading() => copyWith(isLoading: false);

  AllNewsState withError(String error) => copyWith(
        isLoading: false,
        error: error,
      );

  AllNewsState copyWith({
    bool? isLoading,
    String? error = '',
    List<ArticleVM>? articles,
  }) {
    return AllNewsState(
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
