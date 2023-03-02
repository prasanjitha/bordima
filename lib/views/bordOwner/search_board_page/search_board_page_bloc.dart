import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../models/boarding.dart';
import 'search_board_page_event.dart';
import 'search_board_page_state.dart';

class SearchBoardPageBloc
    extends Bloc<SearchBoardPageEvent, SearchBoardPageState> {
  SearchBoardPageBloc(BuildContext context)
      : super(SearchBoardPageState.initialState) {
    FirebaseAuth auth = FirebaseAuth.instance;

    on<InitEvent>((event, emit) async {
      try {
        emit(state.clone(isLoading: true));
        List<BoardModel> board = [];
        var collection = FirebaseFirestore.instance.collection('boardings');
        var querySnapshots = await collection.get();
        log(querySnapshots.docs.toString());
        for (var snapshot in querySnapshots.docs) {
          if (auth.currentUser!.uid == snapshot.data()['boardingUserId']) {
            BoardModel model = BoardModel(
              userId: snapshot.id,
              boardingId: snapshot.data()['boardingId'],
              boardingName: snapshot.data()['boardingName'],
              boardingPrice: snapshot.data()['boardingPrice'],
              boardingType: snapshot.data()['boardingType'],
              boardingUserId: snapshot.data()['boardingUserId'],
              city: snapshot.data()['city'],
              description: snapshot.data()['description'],
              images: snapshot.data()['images'],
              mobile: snapshot.data()['mobile'],
              province: snapshot.data()['province'],
            );
            board.add(model);
          }
        }
        emit(state.clone(isLoading: false, searchBoard: board));
      } catch (e) {
        return Future.error(e.toString());
      }
    });
    on<SearchBoardPlaceEvent>((event, emit) async {
      try {
        emit(state.clone(isLoading: true));
        List<BoardModel> found = [];
        found = state.searchBoard
            .where((element) => element.boardingName == event.name)
            .toList();
        emit(state.clone(isLoading: false, foundBoard: found));
      } catch (e) {
        return Future.error(e.toString());
      }
    });
    add(InitEvent());
  }
}
