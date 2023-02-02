part of 'get_province_bloc.dart';

class GetProvinceState {
  final String province;
  final String boardingType;
  const GetProvinceState({required this.province, required this.boardingType});
  static GetProvinceState get initialState =>
      const GetProvinceState(province: '', boardingType: '');
  GetProvinceState clone({
    String? province,
    String? boardingType,
  }) {
    return GetProvinceState(
      province: province ?? this.province,
      boardingType: boardingType ?? this.boardingType,
    );
  }
}
