import 'package:flutter/foundation.dart';

@immutable
abstract class SearchBoardPageEvent {}

class SearchBoardPlaceEvent extends SearchBoardPageEvent {
  final String name;
  SearchBoardPlaceEvent({required this.name});
}

class InitEvent extends SearchBoardPageEvent {}
