import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
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
  }
}
