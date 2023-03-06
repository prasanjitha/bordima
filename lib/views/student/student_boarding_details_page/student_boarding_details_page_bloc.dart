import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'student_boarding_details_page_event.dart';
import 'student_boarding_details_page_state.dart';

class StudentBoardingDetailsPageBloc extends Bloc<
    StudentBoardingDetailsPageEvent, StudentBoardingDetailsPageState> {
  StudentBoardingDetailsPageBloc(BuildContext context)
      : super(StudentBoardingDetailsPageState.initialState);
}
