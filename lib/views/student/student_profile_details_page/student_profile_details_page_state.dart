import 'package:bordima/models/student.dart';
import 'package:flutter/foundation.dart';

@immutable
class StudentProDetailsPageState {
  final String error;
  final String imageUrl;
  final bool isLoading;
  final List<Student> student;

  const StudentProDetailsPageState({
    required this.error,
    required this.imageUrl,
    required this.isLoading,
    required this.student,
  });

  static StudentProDetailsPageState get initialState {
    return const StudentProDetailsPageState(
        error: '', imageUrl: '', isLoading: false, student: []);
  }

  StudentProDetailsPageState clone({
    String? error,
    String? imageUrl,
    bool? isLoading,
    List<Student>? student,
  }) {
    return StudentProDetailsPageState(
      error: error ?? this.error,
      imageUrl: imageUrl ?? this.imageUrl,
      isLoading: isLoading ?? this.isLoading,
      student: student ?? this.student,
    );
  }
}
