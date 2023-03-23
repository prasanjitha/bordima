import 'package:bordima/models/student.dart';
import 'package:flutter/foundation.dart';

@immutable
class StudentProDetailsPageState {
  final String error;
  final String imageUrl;
  final bool isUploading;
  final bool isLoading;
  final List<Student> student;

  const StudentProDetailsPageState({
    required this.error,
    required this.imageUrl,
    required this.isLoading,
    required this.student,
    required this.isUploading,
  });

  static StudentProDetailsPageState get initialState {
    return const StudentProDetailsPageState(
        error: '',
        imageUrl: '',
        isLoading: false,
        student: [],
        isUploading: false);
  }

  StudentProDetailsPageState clone({
    String? error,
    String? imageUrl,
    bool? isLoading,
    bool? isUploading,
    List<Student>? student,
  }) {
    return StudentProDetailsPageState(
      error: error ?? this.error,
      imageUrl: imageUrl ?? this.imageUrl,
      isLoading: isLoading ?? this.isLoading,
      student: student ?? this.student,
      isUploading: isUploading ?? this.isUploading,
    );
  }
}
