import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'student_profile_details_page_event.dart';
import 'student_profile_details_page_state.dart';

class StudentProDetailsPageBloc
    extends Bloc<StudentProDetailsPageEvent, StudentProDetailsPageState> {
  StudentProDetailsPageBloc(BuildContext context)
      : super(StudentProDetailsPageState.initialState);
}
