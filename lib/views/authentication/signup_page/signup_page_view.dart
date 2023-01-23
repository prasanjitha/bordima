import 'package:bordima/widgets/custom_main_button.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../widgets/custom_main_appbar.dart';
import '../../../widgets/custom_text_field.dart';
import '../signin_page/signin_page_provider.dart';

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  _SignUpPageViewState createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: 'Sign In',
          tap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => SignInPageProvider()),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Let\'s create your bordima account',
              style: Theme.of(context).textTheme.headline2!.copyWith(),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    validator:
                        RequiredValidator(errorText: "Username is required"),
                    controller: nameTextEditingController,
                    prefixIconPath: 'assets/images/icons8-name-tag-24.png',
                    hintText: 'First name',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextFormField(
                    validator:
                        RequiredValidator(errorText: "Username is required"),
                    prefixIconPath: 'assets/images/icons8-name-tag-24.png',
                    controller: nameTextEditingController,
                    hintText: 'Last name',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextFormField(
                    validator:
                        RequiredValidator(errorText: "Email is required"),
                    controller: emailTextEditingController,
                    prefixIconPath: 'assets/images/icons8-mail-24.png',
                    hintText: 'Email address',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextFormField(
                    validator:
                        RequiredValidator(errorText: "Password is required"),
                    controller: passwordTextEditingController,
                    prefixIconPath: 'assets/images/icons8-lock-24.png',
                    hintText: 'Password',
                    obscureText: true,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  'By signing up you accept the Terms of Service and Privacy Policy.',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 14,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomMainButton(
                    tap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => SignInPageProvider()),
                        ),
                      );
                    },
                    btnText: 'Sign Up')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
