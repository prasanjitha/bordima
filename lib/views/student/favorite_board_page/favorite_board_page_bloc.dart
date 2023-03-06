import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'favorite_board_page_event.dart';
import 'favorite_board_page_state.dart';

class FavoriteBoardPageBloc
    extends Bloc<FavoriteBoardPageEvent, FavoriteBoardPageState> {
  FavoriteBoardPageBloc(BuildContext context)
      : super(FavoriteBoardPageState.initialState);
}
