// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bordima/models/comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../models/boarding.dart';
import '../../../themes/custom_colors.dart';
import '../student_home_page_tabbar_page/student_home_page_tabbar_view.dart';
import 'student_boarding_details_page_event.dart';
import 'student_boarding_details_page_state.dart';

class StudentBoardingDetailsPageBloc extends Bloc<
    StudentBoardingDetailsPageEvent, StudentBoardingDetailsPageState> {
  TextEditingController commentTextEditingController = TextEditingController();
  StudentBoardingDetailsPageBloc(BuildContext context, BoardModel board)
      : super(StudentBoardingDetailsPageState.initialState) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    on<AddCommentEvent>((event, emit) async {
      log(event.commnet);
      emit(state.clone(isLoading: true));
      try {
        await firestore
            .collection('comment')
            .doc(DateTime.now().toString())
            .set({
          "comment": event.commnet,
          "boardingID": board.boardingId,
          "userId": auth.currentUser!.uid
        });
        var snackBar = const SnackBar(
            backgroundColor: CustomColors.PRIMARY, content: Text('Added!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CustomerTabBarView(),
          ),
        );
        emit(state.clone(isLoading: false));
      } catch (e) {
        return Future.error(e.toString());
      }
    });
    on<InitEvent>((event, emit) async {
      try {
        emit(state.clone(isLoading: true));
        List<CommentModel> comment = [];
        var collection = FirebaseFirestore.instance.collection('comment');
        var querySnapshots = await collection.get();
        log(querySnapshots.docs.toString());
        for (var snapshot in querySnapshots.docs) {
          if (board.boardingId == snapshot.data()['boardingID']) {
            CommentModel model = CommentModel(
              userId: snapshot.data()['userId'],
              commnetId: snapshot.id,
              boardingId: snapshot.data()['boardingID'],
              comment: snapshot.data()['comment'],
            );

            comment.add(model);
          }
        }
        log(comment[0].comment.toString());
        emit(state.clone(isLoading: false, allComments: comment));
      } catch (e) {
        return Future.error(e.toString());
      }
    });
    add(InitEvent());
  }
}
