import 'package:flutter/foundation.dart';

@immutable
class BDOwnerHomePageState {
  final String error;

  const BDOwnerHomePageState({
    required this.error,
  });

  static BDOwnerHomePageState get initialState {
    return const BDOwnerHomePageState(error: '');
  }

  BDOwnerHomePageState clone({
    String? error,
  }) {
    return BDOwnerHomePageState(
      error: error ?? this.error,
    );
  }
}
