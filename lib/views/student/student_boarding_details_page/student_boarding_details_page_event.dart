import 'package:flutter/foundation.dart';

@immutable
abstract class StudentBoardingDetailsPageEvent {}

class AddCommentEvent extends StudentBoardingDetailsPageEvent {
  final String commnet;
  AddCommentEvent({required this.commnet});
}

class InitEvent extends StudentBoardingDetailsPageEvent {}
