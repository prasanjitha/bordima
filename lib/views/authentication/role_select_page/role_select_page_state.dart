import 'package:flutter/foundation.dart';

@immutable
class RoleSelectPageState {
  final String role;

  const RoleSelectPageState({
    required this.role,
  });

  static RoleSelectPageState get initialState {
    return const RoleSelectPageState(role: '');
  }

  RoleSelectPageState clone({
    String? role,
  }) {
    return RoleSelectPageState(
      role: role ?? this.role,
    );
  }
}
