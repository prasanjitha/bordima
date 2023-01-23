import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'main_home_page_event.dart';
import 'main_home_page_state.dart';

class MainHomePageBloc extends Bloc<MainHomePageEvent, MainHomePageState> {
  MainHomePageBloc(BuildContext context)
      : super(MainHomePageState.initialState);
}
