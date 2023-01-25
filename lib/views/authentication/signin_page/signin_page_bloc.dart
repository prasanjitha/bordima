import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../themes/custom_colors.dart';
import '../../../themes/custom_text_styles.dart';
import '../../student/student_home_page_tabbar_page/student_home_page_tabbar_view.dart';
import 'signin_page_event.dart';
import 'signin_page_state.dart';

class SignInPageBloc extends Bloc<SignInPageEvent, SignInPageState> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  SignInPageBloc(BuildContext context) : super(SignInPageState.initialState) {
    on<UserLoginEvent>((event, emit) async {
      FirebaseAuth auth = FirebaseAuth.instance;
      try {
        emit(state.clone(isLoading: true));
        await auth
            .signInWithEmailAndPassword(
                email: event.email, password: event.password)
            .then((value) {
          showTopSnackBar(
            context,
            const CustomSnackBar.success(
              backgroundColor: CustomColors.PRIMARY,
              message: "Successfully  login",
              textStyle: CustomTextStyles.ERROR_TEXT_STYLE,
            ),
          );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const CustomerTabBarView()),
            ),
          );
          emit(state.clone(isLoading: false));
        }).catchError((err) {
          emit(state.clone(isLoading: false));
          showTopSnackBar(
            context,
            const CustomSnackBar.error(
              backgroundColor: CustomColors.ERROR,
              message:
                  "Something went wrong. Please check your credentials and try again",
              textStyle: CustomTextStyles.ERROR_TEXT_STYLE,
            ),
          );
        });
      } catch (e) {
        emit(state.clone(isLoading: false));
        return Future.error(e.toString());
      }
    });
  }
}
