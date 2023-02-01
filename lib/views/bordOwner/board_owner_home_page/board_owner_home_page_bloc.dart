import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'board_owner_home_page_event.dart';
import 'board_owner_home_page_state.dart';

class BDOwnerHomePageBloc
    extends Bloc<BDOwnerHomePageEvent, BDOwnerHomePageState> {
  BDOwnerHomePageBloc(BuildContext context)
      : super(BDOwnerHomePageState.initialState);
}
