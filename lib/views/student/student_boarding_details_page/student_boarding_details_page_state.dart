import 'package:bordima/models/comment.dart';
import 'package:flutter/foundation.dart';

@immutable
class StudentBoardingDetailsPageState {
  final String error;
  final bool isLoading;
  final List<CommentModel> allComments;

  const StudentBoardingDetailsPageState({
    required this.error,
    required this.isLoading,
    required this.allComments,
  });

  static StudentBoardingDetailsPageState get initialState {
    return const StudentBoardingDetailsPageState(
        error: '', isLoading: false, allComments: []);
  }

  StudentBoardingDetailsPageState clone({
    String? error,
    bool? isLoading,
    List<CommentModel>? allComments,
  }) {
    return StudentBoardingDetailsPageState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      allComments: allComments ?? this.allComments,
    );
  }
}
