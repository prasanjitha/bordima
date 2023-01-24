import 'package:flutter/foundation.dart';

@immutable
class StudentProDetailsPageState {
  final String error;

  const StudentProDetailsPageState({
    required this.error,
  });

  static StudentProDetailsPageState get initialState {
    return const StudentProDetailsPageState(error: '');
  }

  StudentProDetailsPageState clone({
    String? error,
  }) {
    return StudentProDetailsPageState(
      error: error ?? this.error,
    );
  }
}
