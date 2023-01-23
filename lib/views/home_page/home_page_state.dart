import 'package:flutter/foundation.dart';

@immutable
class HomePageState {
  final String error;

  const HomePageState({
    required this.error,
  });

  static HomePageState get initialState {
    return const HomePageState(error: '');
  }

  HomePageState clone({
    String? error,
  }) {
    return HomePageState(
      error: error ?? this.error,
    );
  }
}
