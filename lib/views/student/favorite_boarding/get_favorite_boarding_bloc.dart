import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/boarding.dart';
part 'get_favorite_boarding_province_event.dart';
part 'get_favorite_boarding_province_state.dart';

class GetFavoriteBoardingBloc
    extends Bloc<GetFavoriteBoardingEvent, GetFavoriteBoardingState> {
  GetFavoriteBoardingBloc(BuildContext context)
      : super(GetFavoriteBoardingState.initialState) {
    final List<BoardModel> myFavBoarding = [];
    on<AddFavoriteBoardingEvent>((event, emit) {
      emit(state.clone(isLoading: true));
      if (myFavBoarding.contains(event.favBoarding)) {
        log('Already added!');
      } else {
        myFavBoarding.add(event.favBoarding);
      }
      emit(state.clone(isLoading: false, favoriteBoarding: myFavBoarding));
    });
    on<RemoveFavoriteBoardingEvent>((event, emit) {
      emit(state.clone(isLoading: true));
      if (myFavBoarding.contains(event.favBoarding)) {
        myFavBoarding.remove(event.favBoarding);
      }
      emit(state.clone(isLoading: false, favoriteBoarding: myFavBoarding));
    });
  }
}
