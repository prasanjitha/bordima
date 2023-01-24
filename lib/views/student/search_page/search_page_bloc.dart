import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'search_page_event.dart';
import 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  SearchPageBloc(BuildContext context) : super(SearchPageState.initialState);
}
