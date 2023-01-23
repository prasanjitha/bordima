import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'bording_details_page_event.dart';
import 'bording_details_page_state.dart';

class BordingDetailsPageBloc
    extends Bloc<BordingDetailsPageEvent, BordingDetailsPageState> {
  BordingDetailsPageBloc(BuildContext context)
      : super(BordingDetailsPageState.initialState);
}
