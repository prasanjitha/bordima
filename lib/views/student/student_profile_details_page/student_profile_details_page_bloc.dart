import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:bordima/models/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../themes/custom_colors.dart';
import 'student_profile_details_page_event.dart';
import 'student_profile_details_page_state.dart';

class StudentProDetailsPageBloc
    extends Bloc<StudentProDetailsPageEvent, StudentProDetailsPageState> {
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
  String profileUrl = '';
  StudentProDetailsPageBloc(BuildContext context)
      : super(StudentProDetailsPageState.initialState) {
    final storageRef = FirebaseStorage.instance.ref();
    ImagePicker picker = ImagePicker();
    FirebaseAuth auth = FirebaseAuth.instance;

    on<InitEvent>((event, emit) async {
      try {
        emit(state.clone(isLoading: true));
        List<Student> student = [];
        var collection = FirebaseFirestore.instance.collection('users');
        var querySnapshots = await collection.get();
        log(querySnapshots.docs.toString());
        for (var snapshot in querySnapshots.docs) {
          if (auth.currentUser!.uid == snapshot.data()['userId']) {
            Student model = Student(
              documentId: snapshot.data()['profileUrl'],
              studentId: snapshot.data()['userId'],
              firstName: snapshot.data()['FirstName'],
              lastName: snapshot.data()['LastName'],
              email: snapshot.data()['email'],
              province: snapshot.data()['province'],
              town: snapshot.data()['town'],
            );
            student.add(model);
          }
        }
        log(student.toString());
        firstNameTextEditingController.text = student[0].firstName;
        lastNameTextEditingController.text = student[0].lastName;
        provinceTextEditingController.text = student[0].province.isEmpty
            ? 'Update your province'
            : student[0].province;
        townTextEditingController.text =
            student[0].town.isEmpty ? 'Update your town' : student[0].town;
        emailTextEditingController.text = student[0].email;
        log('message');
        log(student[0].documentId);
        profileUrl = student[0].documentId;
        emit(state.clone(isLoading: false));
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
    on<UpdateUserDataEvent>((event, emit) {
      try {
        emit(state.clone(isUploading: true));
        String propicUrl = state.imageUrl.isEmpty ? profileUrl : state.imageUrl;
        var collection = FirebaseFirestore.instance.collection('users');
        collection.doc(auth.currentUser!.uid).update({
          'province': event.province,
          'FirstName': event.firstName,
          'LastName': event.lastName,
          'town': event.city,
          'profileUrl': propicUrl,
        });
        var snackBar = const SnackBar(
            backgroundColor: CustomColors.PRIMARY, content: Text('Updated!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        emit(state.clone(isUploading: false));
      } catch (e) {
        return Future.error(e.toString());
      }
    });
  }
}
