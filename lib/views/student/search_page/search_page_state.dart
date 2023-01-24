import 'package:flutter/foundation.dart';

@immutable
class SearchPageState {
  final String error;

  const SearchPageState({
    required this.error,
  });

  static SearchPageState get initialState {
    return const SearchPageState(error: '');
  }

  SearchPageState clone({
    String? error,
  }) {
    return SearchPageState(
      error: error ?? this.error,
    );
  }
}
