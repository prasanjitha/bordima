import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'signup_page_event.dart';
import 'signup_page_state.dart';

class SignUpPageBloc extends Bloc<SignUpPageEvent, SignUpPageState> {
  SignUpPageBloc(BuildContext context) : super(SignUpPageState.initialState);
}
