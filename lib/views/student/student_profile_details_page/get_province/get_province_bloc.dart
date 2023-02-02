import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'get_province_event.dart';
part 'get_province_state.dart';

class GetProvinceBloc extends Bloc<GetProvinceEvent, GetProvinceState> {
  GetProvinceBloc(BuildContext context) : super(GetProvinceState.initialState) {
    on<GetMyProvinceEvent>((event, emit) {
      log(event.province);
      emit(state.clone(province: event.province));
    });
    on<GetMyBoardingTypeEvent>((event, emit) {
      log(event.type);
      emit(state.clone(boardingType: event.type));
    });
  }
}
