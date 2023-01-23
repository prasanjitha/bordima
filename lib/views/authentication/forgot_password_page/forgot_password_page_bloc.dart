import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'forgot_password_page_event.dart';
import 'forgot_password_page_state.dart';

class ForgotPasswordPageBloc
    extends Bloc<ForgotPasswordPageEvent, ForgotPasswordPageState> {
  ForgotPasswordPageBloc(BuildContext context)
      : super(ForgotPasswordPageState.initialState);
}
