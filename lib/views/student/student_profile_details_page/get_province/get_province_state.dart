part of 'get_province_bloc.dart';

class GetProvinceState {
  final String province;
  const GetProvinceState({required this.province});
  static GetProvinceState get initialState =>
      const GetProvinceState(province: '');
  GetProvinceState clone({
    String? province,
  }) {
    return GetProvinceState(province: province ?? this.province);
  }
}
