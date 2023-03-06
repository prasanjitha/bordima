import 'package:flutter/foundation.dart';

@immutable
class FavoriteBoardPageState {
  final String error;

  const FavoriteBoardPageState({
    required this.error,
  });

  static FavoriteBoardPageState get initialState {
    return const FavoriteBoardPageState(error: '');
  }

  FavoriteBoardPageState clone({
    String? error,
  }) {
    return FavoriteBoardPageState(
      error: error ?? this.error,
    );
  }
}
