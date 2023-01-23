import 'package:flutter/foundation.dart';

@immutable
class RoleSelectPageState {
  final String error;

  const RoleSelectPageState({
    required this.error,
  });

  static RoleSelectPageState get initialState {
    return const RoleSelectPageState(error: '');
  }

  RoleSelectPageState clone({
    String? error,
  }) {
    return RoleSelectPageState(
      error: error ?? this.error,
    );
  }
}
