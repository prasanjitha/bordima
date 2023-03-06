import 'package:flutter/foundation.dart';

import '../../../models/boarding.dart';

@immutable
class MyBoardingPageState {
  final String error;
  final List<BoardModel> myBoards;
  final bool isLoading;

  const MyBoardingPageState({
    required this.error,
    required this.myBoards,
    required this.isLoading,
  });

  static MyBoardingPageState get initialState {
    return const MyBoardingPageState(error: '', myBoards: [], isLoading: false);
  }

  MyBoardingPageState clone({
    String? error,
    List<BoardModel>? myBoards,
    bool? isLoading,
  }) {
    return MyBoardingPageState(
      error: error ?? this.error,
      myBoards: myBoards ?? this.myBoards,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
