import 'package:flutter/foundation.dart';

@immutable
class SignUpPageState {
  final String error;

  const SignUpPageState({
    required this.error,
  });

  static SignUpPageState get initialState {
    return const SignUpPageState(error: '');
  }

  SignUpPageState clone({
    String? error,
  }) {
    return SignUpPageState(
      error: error ?? this.error,
    );
  }
}
