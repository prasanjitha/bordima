import 'package:flutter/foundation.dart';

@immutable
abstract class AddBoardingPageEvent {}

class UploadImageEvent extends AddBoardingPageEvent {}

class SubmitBoardingData extends AddBoardingPageEvent {
  final List<String> images;
  final String boardingName;
  final String province;
  final String city;
  final String mobile;
  final String boardingType;
  final String boardingPrice;
  final String description;
  SubmitBoardingData({
    required this.boardingName,
    required this.boardingPrice,
    required this.boardingType,
    required this.city,
    required this.description,
    required this.images,
    required this.mobile,
    required this.province,
  });
}

class PressButton extends AddBoardingPageEvent {}
