import 'package:flutter/foundation.dart';

@immutable
abstract class StudentProDetailsPageEvent {}

class UploadImageEvent extends StudentProDetailsPageEvent {}

class UpdateUserDataEvent extends StudentProDetailsPageEvent {
  final String province;
  final String firstName;
  final String lastName;
  final String city;
  UpdateUserDataEvent(
      {required this.province,
      required this.firstName,
      required this.city,
      required this.lastName});
}

class InitEvent extends StudentProDetailsPageEvent {}
