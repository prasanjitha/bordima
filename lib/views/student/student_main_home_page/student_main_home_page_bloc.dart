import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'student_main_home_page_event.dart';
import 'student_main_home_page_state.dart';

class StudentMainHomePageBloc
    extends Bloc<StudentMainHomePageEvent, StudentMainHomePageState> {
  StudentMainHomePageBloc(BuildContext context)
      : super(StudentMainHomePageState.initialState);
}
