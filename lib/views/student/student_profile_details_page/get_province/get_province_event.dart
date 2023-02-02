part of 'get_province_bloc.dart';

abstract class GetProvinceEvent {}

class GetMyProvinceEvent extends GetProvinceEvent {
  String province;
  GetMyProvinceEvent(this.province);
}

class GetMyBoardingTypeEvent extends GetProvinceEvent {
  String type;
  GetMyBoardingTypeEvent(this.type);
}
