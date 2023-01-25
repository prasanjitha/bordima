import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:bordima/models/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

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
  StudentProDetailsPageBloc(BuildContext context)
      : super(StudentProDetailsPageState.initialState) {
    final storageRef = FirebaseStorage.instance.ref();
    ImagePicker picker = ImagePicker();
    on<InitEvent>((event, emit) async {
      try {
        List<Student> student = [];
        var collection = FirebaseFirestore.instance.collection('users');
        var querySnapshots = await collection.get();
        log(querySnapshots.docs.toString());
        for (var snapshot in querySnapshots.docs) {
          Student model = Student(
            documentId: snapshot.id,
            studentId: snapshot.data()['userId'],
            firstName: snapshot.data()['FirstName'],
            lastName: snapshot.data()['LastName'],
            email: snapshot.data()['email'],
            province: snapshot.data()['province'],
            town: snapshot.data()['town'],
          );
          student.add(model);
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
