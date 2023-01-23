import 'package:flutter/foundation.dart';

@immutable
class MainHomePageState {
  final String error;

  const MainHomePageState({
    required this.error,
  });

  static MainHomePageState get initialState {
    return const MainHomePageState(error: '');
  }

  MainHomePageState clone({
    String? error,
  }) {
    return MainHomePageState(
      error: error ?? this.error,
    );
  }
}
