import 'package:flutter/foundation.dart';

@immutable
class SignUpPageState {
  final String userRole;
  final bool isLoading;
  final bool issubmitted;

  const SignUpPageState({
    required this.userRole,
    required this.isLoading,
    required this.issubmitted,
  });

  static SignUpPageState get initialState {
    return const SignUpPageState(
        userRole: '', isLoading: false, issubmitted: false);
  }

  SignUpPageState clone({
    String? userRole,
    bool? isLoading,
    bool? issubmitted,
  }) {
    return SignUpPageState(
      userRole: userRole ?? this.userRole,
      isLoading: isLoading ?? this.isLoading,
      issubmitted: issubmitted ?? this.issubmitted,
    );
  }
}
