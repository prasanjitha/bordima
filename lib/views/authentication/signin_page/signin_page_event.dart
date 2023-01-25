import 'package:flutter/foundation.dart';

@immutable
abstract class SignInPageEvent {}

class UserLoginEvent extends SignInPageEvent {
  final String email;
  final String password;

  UserLoginEvent({
    required this.email,
    required this.password,
  });
}
