import 'package:bordima/views/authentication/forgot_password_page/forgot_password_page_provider.dart';
import 'package:bordima/views/authentication/role_select_page/role_select_page_provider.dart';
import 'package:bordima/views/authentication/signin_page/signin_page_bloc.dart';
import 'package:bordima/views/authentication/signin_page/signin_page_event.dart';
import 'package:bordima/views/authentication/signin_page/signin_page_state.dart';
import 'package:bordima/views/main_home_page/main_home_page_provider.dart';
import 'package:bordima/widgets/custom_main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../widgets/custom_circular_progrss_indicator.dart';
import '../../../widgets/custom_main_appbar.dart';
import '../../../widgets/custom_text_field.dart';
import '../../student/student_home_page_tabbar_page/student_home_page_tabbar_view.dart';
import '../../student/student_main_home_page/student_main_home_page_view.dart';
import '../signup_page/signup_page_provider.dart';

class SignInPageView extends StatefulWidget {
  const SignInPageView({Key? key}) : super(key: key);

  @override
  _SignInPageViewState createState() => _SignInPageViewState();
}

class _SignInPageViewState extends State<SignInPageView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final SignInPageBloc bloc = BlocProvider.of<SignInPageBloc>(context);
    var body = SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome back! You’ve been missed',
              style: Theme.of(context).textTheme.headline2!.copyWith(),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Image.asset(
              'assets/images/undraw_access_account_re_8spm.png',
              height: 150,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    validator:
                        RequiredValidator(errorText: "Email is required"),
                    controller: bloc.emailTextEditingController,
                    prefixIconPath: 'assets/images/icons8-mail-24.png',
                    hintText: 'Email address',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextFormField(
                    validator:
                        RequiredValidator(errorText: "Password is required"),
                    controller: bloc.passwordTextEditingController,
                    prefixIconPath: 'assets/images/icons8-lock-24.png',
                    hintText: 'Password',
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => ForgotPasswordPageProvider()),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot password ?',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 14,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomMainButton(
                  tap: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(UserLoginEvent(
                        email: bloc.emailTextEditingController.text.trim(),
                        password:
                            bloc.passwordTextEditingController.text.trim(),
                      ));
                    }
                  },
                  btnText: 'Sign In',
                ),
              ],
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: 'Sign up',
          tap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => RoleSelectPageProvider()),
              ),
            );
          },
        ),
      ),
      body: BlocBuilder<SignInPageBloc, SignInPageState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return CustomCircularProgressIndicator(body: body);
          }
          return body;
        },
      ),
    );
  }
}
