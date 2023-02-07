import 'package:flutter/foundation.dart';

@immutable
class MyBoardingPageState {
  final String error;

  const MyBoardingPageState({
    required this.error,
  });

  static MyBoardingPageState get initialState {
    return const MyBoardingPageState(error: '');
  }

  MyBoardingPageState clone({
    String? error,
  }) {
    return MyBoardingPageState(
      error: error ?? this.error,
    );
  }
}
