import 'package:flutter/foundation.dart';

@immutable
class SignInPageState {
  final String error;

  const SignInPageState({
    required this.error,
  });

  static SignInPageState get initialState {
    return const SignInPageState(error: '');
  }

  SignInPageState clone({
    String? error,
  }) {
    return SignInPageState(
      error: error ?? this.error,
    );
  }
}
