import 'package:flutter/foundation.dart';

@immutable
abstract class BWProfilePageEvent {}

class UploadImageEvent extends BWProfilePageEvent {}

class InitEvent extends BWProfilePageEvent {}
