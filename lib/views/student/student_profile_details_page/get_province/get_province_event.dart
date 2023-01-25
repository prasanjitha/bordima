part of 'get_province_bloc.dart';

abstract class GetProvinceEvent {}

class GetMyProvinceEvent extends GetProvinceEvent {
  String province;
  GetMyProvinceEvent(this.province);
}
