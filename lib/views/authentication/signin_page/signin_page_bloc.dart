import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'signin_page_event.dart';
import 'signin_page_state.dart';

class SignInPageBloc extends Bloc<SignInPageEvent, SignInPageState> {
  SignInPageBloc(BuildContext context) : super(SignInPageState.initialState);
}
