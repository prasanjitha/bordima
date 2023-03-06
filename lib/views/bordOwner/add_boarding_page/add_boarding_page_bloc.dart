import 'dart:developer';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../bord_owner_tabbar_view/boad_owner_home_page_tabbar_view.dart';
import 'add_boarding_page_event.dart';
import 'add_boarding_page_state.dart';

class AddBoardingPageBloc
    extends Bloc<AddBoardingPageEvent, AddBoardingPageState> {
  TextEditingController boardingNameTextEditingController =
      TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController mobileTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();
  TextEditingController priceTextEditingController = TextEditingController();
  AddBoardingPageBloc(BuildContext context)
      : super(AddBoardingPageState.initialState) {
    final storageRef = FirebaseStorage.instance.ref();
    ImagePicker picker = ImagePicker();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    on<UploadImageEvent>((event, emit) async {
      var uuid = const Uuid();
      try {
        List<String> urls = [];
        for (var i in state.allUrls) {
          urls.add(i);
        }
        emit(state.clone(isLoading: true));
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        final imgRef = storageRef.child("${uuid.v4()}.jpg");
        String url = '';
        if (image != null) {
          File imgFile = File(image.path);
          await imgRef.putFile(imgFile);
          url = await imgRef.getDownloadURL();
          urls.add(url);
          log('my urls');
          log(urls.toString());
          emit(state.clone(
            isLoading: false,
            allUrls: urls,
          ));
        }
      } catch (e) {
        return Future.error(e.toString());
      }
    });
    on<SubmitBoardingData>((event, emit) async {
      log('message');
      try {
        var uuid = const Uuid();
        if (auth.currentUser != null) {
          await firestore.collection('boardings').doc(uuid.v4()).set({
            "boardingId": uuid.v4(),
            "boardingUserId": auth.currentUser!.uid,
            "images": event.images,
            "boardingName": event.boardingName,
            "province": event.province,
            "city": event.city,
            "mobile": event.mobile,
            "boardingType": event.boardingType,
            "boardingPrice": event.boardingPrice,
            "description": event.description,
          });
        }
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const BordOwnerTabBarView()),
          ),
        );
      } catch (e) {
        return Future.error('Something went wrong! $e');
      }
    });
  }
}
