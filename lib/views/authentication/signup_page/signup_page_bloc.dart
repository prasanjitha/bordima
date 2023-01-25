import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../signin_page/signin_page_provider.dart';
import 'signup_page_event.dart';
import 'signup_page_state.dart';

class SignUpPageBloc extends Bloc<SignUpPageEvent, SignUpPageState> {
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  SignUpPageBloc(BuildContext context, String role)
      : super(SignUpPageState.initialState) {
    on<UserSubmitDataEvent>((event, emit) async {
      emit(state.clone(isLoading: true));
      final userData = {
        "firstName": event.firstName,
        "lastName": event.lastName,
        "email": event.email,
        "password": event.password,
        "role": role,
      };
      log(userData.toString());
      await createUser(userData);
      emit(state.clone(isLoading: false));
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: ((context) => SignInPageProvider()),
        ),
      );
    });
  }

  Future<User?> createUser(Map<String, String> userData) async {
    final String firstName = userData['firstName'].toString();
    final String lastName = userData['lastName'].toString();
    final String email = userData['email'].toString();
    final String password = userData['password'].toString();
    final String role = userData['role'].toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      User? user = (await auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        user.updateDisplayName(firstName + lastName);
        await firestore.collection('users').doc(auth.currentUser!.uid).set({
          "FirstName": firstName,
          "LastName": lastName,
          "role": role,
          "email": email,
          "province": '',
          "town": '',
          "userId": auth.currentUser!.uid
        });
        return user;
      } else {
        return user;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
