import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'student_favorite_bord_page_event.dart';
import 'student_favorite_bord_page_state.dart';

class StudentFavBordPageBloc
    extends Bloc<StudentFavBordPageEvent, StudentFavBordPageState> {
  StudentFavBordPageBloc(BuildContext context)
      : super(StudentFavBordPageState.initialState);
}
