part of 'top_news_bloc.dart';

class TopNewsState extends Equatable {
  const TopNewsState({
    this.isLoading = false,
    this.error = '',
  });

  final bool isLoading;
  final String error;

  TopNewsState withLoading() => copyWith(isLoading: true);

  TopNewsState withoutLoading() => copyWith(isLoading: false);

  TopNewsState withError(String error) => copyWith(
        isLoading: false,
        error: error,
      );

  TopNewsState copyWith({
    bool? isLoading,
    String? error = '',
  }) {
    return TopNewsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
      ];
}
