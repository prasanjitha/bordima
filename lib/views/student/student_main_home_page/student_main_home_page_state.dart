import 'package:flutter/foundation.dart';

import '../../../models/boarding.dart';

@immutable
class StudentMainHomePageState {
  final String error;
  final bool isLoading;
  final List<BoardModel> allBoarding;
  final List<BoardModel> nearestBoarding;

  const StudentMainHomePageState({
    required this.error,
    required this.isLoading,
    required this.allBoarding,
    required this.nearestBoarding,
  });

  static StudentMainHomePageState get initialState {
    return const StudentMainHomePageState(
        error: '', isLoading: false, allBoarding: [], nearestBoarding: []);
  }

  StudentMainHomePageState clone({
    String? error,
    bool? isLoading,
    List<BoardModel>? allBoarding,
    List<BoardModel>? nearestBoarding,
  }) {
    return StudentMainHomePageState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      allBoarding: allBoarding ?? this.allBoarding,
      nearestBoarding: nearestBoarding ?? this.nearestBoarding,
    );
  }
}
