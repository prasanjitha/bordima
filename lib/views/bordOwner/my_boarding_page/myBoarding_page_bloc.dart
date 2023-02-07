import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'myBoarding_page_event.dart';
import 'myBoarding_page_state.dart';

class MyBoardingPageBloc
    extends Bloc<MyBoardingPageEvent, MyBoardingPageState> {
  MyBoardingPageBloc(BuildContext context)
      : super(MyBoardingPageState.initialState);
}
