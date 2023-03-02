import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'boarding_details_page_event.dart';
import 'boarding_details_page_state.dart';

class BoardingDetailsPageBloc
    extends Bloc<BoardingDetailsPageEvent, BoardingDetailsPageState> {
  BoardingDetailsPageBloc(BuildContext context)
      : super(BoardingDetailsPageState.initialState);
}
