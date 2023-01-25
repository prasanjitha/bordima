import 'package:flutter/foundation.dart';

@immutable
class SignInPageState {
  final String error;
  final bool isLoading;

  const SignInPageState({
    required this.error,
    required this.isLoading,
  });

  static SignInPageState get initialState {
    return const SignInPageState(error: '', isLoading: false);
  }

  SignInPageState clone({
    String? error,
    bool? isLoading,
  }) {
    return SignInPageState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
