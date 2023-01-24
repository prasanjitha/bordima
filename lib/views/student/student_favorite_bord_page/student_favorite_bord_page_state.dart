import 'package:flutter/foundation.dart';

@immutable
class StudentFavBordPageState {
  final String error;

  const StudentFavBordPageState({
    required this.error,
  });

  static StudentFavBordPageState get initialState {
    return const StudentFavBordPageState(error: '');
  }

  StudentFavBordPageState clone({
    String? error,
  }) {
    return StudentFavBordPageState(
      error: error ?? this.error,
    );
  }
}
