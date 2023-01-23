import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'role_select_page_event.dart';
import 'role_select_page_state.dart';

class RoleSelectPageBloc
    extends Bloc<RoleSelectPageEvent, RoleSelectPageState> {
  RoleSelectPageBloc(BuildContext context)
      : super(RoleSelectPageState.initialState);
}
