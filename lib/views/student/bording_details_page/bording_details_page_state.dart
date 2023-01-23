import 'package:flutter/foundation.dart';

@immutable
class BordingDetailsPageState {
  final String error;

  const BordingDetailsPageState({
    required this.error,
  });

  static BordingDetailsPageState get initialState {
    return const BordingDetailsPageState(error: '');
  }

  BordingDetailsPageState clone({
    String? error,
  }) {
    return BordingDetailsPageState(
      error: error ?? this.error,
    );
  }
}
