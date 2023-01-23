import 'package:flutter/foundation.dart';

@immutable
class ForgotPasswordPageState {
  final String error;

  const ForgotPasswordPageState({
    required this.error,
  });

  static ForgotPasswordPageState get initialState {
    return const ForgotPasswordPageState(error: '');
  }

  ForgotPasswordPageState clone({
    String? error,
  }) {
    return ForgotPasswordPageState(
      error: error ?? this.error,
    );
  }
}
