import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../models/boarding.dart';
import 'student_main_home_page_event.dart';
import 'student_main_home_page_state.dart';

class StudentMainHomePageBloc
    extends Bloc<StudentMainHomePageEvent, StudentMainHomePageState> {
  StudentMainHomePageBloc(BuildContext context)
      : super(StudentMainHomePageState.initialState) {
    on<InitEvent>((event, emit) async {
      try {
        emit(state.clone(isLoading: true));
        List<BoardModel> board = [];
        var collection = FirebaseFirestore.instance.collection('boardings');
        var querySnapshots = await collection.get();
        log(querySnapshots.docs.toString());
        for (var snapshot in querySnapshots.docs) {
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
        log(board[0].userId.toString());
        emit(state.clone(isLoading: false, allBoarding: board));
      } catch (e) {
        return Future.error(e.toString());
      }
    });
    add(InitEvent());
    on<MyNearestBoardEvent>((event, emit) async {
      try {
        emit(state.clone(isLoading: true));
        List<BoardModel> board = [];
        var collection = FirebaseFirestore.instance.collection('boardings');
        var querySnapshots = await collection.get();
        log(querySnapshots.docs.toString());
        for (var snapshot in querySnapshots.docs) {
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
        log(board[0].userId.toString());
        emit(state.clone(isLoading: false, allBoarding: board));
      } catch (e) {
        return Future.error(e.toString());
      }
    });
    add(MyNearestBoardEvent());
  }
}
