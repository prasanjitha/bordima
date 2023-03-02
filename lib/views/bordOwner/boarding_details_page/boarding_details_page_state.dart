import 'package:flutter/foundation.dart';

@immutable
class BoardingDetailsPageState {
  final String error;

  const BoardingDetailsPageState({
    required this.error,
  });

  static BoardingDetailsPageState get initialState {
    return const BoardingDetailsPageState(error: '');
  }

  BoardingDetailsPageState clone({
    String? error,
  }) {
    return BoardingDetailsPageState(
      error: error ?? this.error,
    );
  }
}
