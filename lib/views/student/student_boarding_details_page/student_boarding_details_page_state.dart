import 'package:flutter/foundation.dart';

@immutable
class StudentBoardingDetailsPageState {
  final String error;

  const StudentBoardingDetailsPageState({
    required this.error,
  });

  static StudentBoardingDetailsPageState get initialState {
    return const StudentBoardingDetailsPageState(error: '');
  }

  StudentBoardingDetailsPageState clone({
    String? error,
  }) {
    return StudentBoardingDetailsPageState(
      error: error ?? this.error,
    );
  }
}
