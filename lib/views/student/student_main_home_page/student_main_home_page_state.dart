import 'package:flutter/foundation.dart';

@immutable
class StudentMainHomePageState {
  final String error;

  const StudentMainHomePageState({
    required this.error,
  });

  static StudentMainHomePageState get initialState {
    return const StudentMainHomePageState(error: '');
  }

  StudentMainHomePageState clone({
    String? error,
  }) {
    return StudentMainHomePageState(
      error: error ?? this.error,
    );
  }
}
