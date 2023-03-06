import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bordima/models/boardOwner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'board_owner_profile_page_event.dart';
import 'board_owner_profile_page_state.dart';

class BWProfilePageBloc extends Bloc<BWProfilePageEvent, BWProfilePageState> {
  final TextEditingController firstNameTextEditingController =
      TextEditingController();
  final TextEditingController lastNameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController provinceTextEditingController =
      TextEditingController();
  final TextEditingController townTextEditingController =
      TextEditingController();
  BWProfilePageBloc(BuildContext context)
      : super(BWProfilePageState.initialState) {
    final storageRef = FirebaseStorage.instance.ref();
    FirebaseAuth auth = FirebaseAuth.instance;

    ImagePicker picker = ImagePicker();
    on<InitEvent>((event, emit) async {
      try {
        List<BoardOwner> boardOwner = [];
        var collection = FirebaseFirestore.instance.collection('users');
        var querySnapshots = await collection.get();
        log(querySnapshots.docs.toString());
        for (var snapshot in querySnapshots.docs) {
          if (auth.currentUser!.uid == snapshot.data()['userId']) {
            BoardOwner model = BoardOwner(
              documentId: snapshot.id,
              boardOwnerId: snapshot.data()['userId'],
              firstName: snapshot.data()['FirstName'],
              lastName: snapshot.data()['LastName'],
              email: snapshot.data()['email'],
              province: snapshot.data()['province'],
              town: snapshot.data()['town'],
            );
            boardOwner.add(model);
          }
        }
        log(boardOwner.toString());
        firstNameTextEditingController.text = boardOwner[0].firstName;
        lastNameTextEditingController.text = boardOwner[0].lastName;
        provinceTextEditingController.text = boardOwner[0].province.isEmpty
            ? 'Update your province'
            : boardOwner[0].province;
        townTextEditingController.text = boardOwner[0].town.isEmpty
            ? 'Update your town'
            : boardOwner[0].town;
        emailTextEditingController.text = boardOwner[0].email;
      } catch (e) {
        return Future.error(e.toString());
      }
    });
    add(InitEvent());
    on<UploadImageEvent>((event, emit) async {
      var uuid = const Uuid();
      try {
        emit(state.clone(isLoading: true));
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        final imgRef = storageRef.child("${uuid.v4()}.jpg");
        String url = '';
        if (image != null) {
          File imgFile = File(image.path);
          await imgRef.putFile(imgFile);
          url = await imgRef.getDownloadURL();
          log(url.toString());
          emit(state.clone(isLoading: false, imageUrl: url));
        }
      } catch (e) {
        return Future.error(e.toString());
      }
    });
  }
}
