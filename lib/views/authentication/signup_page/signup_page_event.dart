import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SignUpPageEvent {}

class UserSubmitDataEvent extends SignUpPageEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  UserSubmitDataEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
