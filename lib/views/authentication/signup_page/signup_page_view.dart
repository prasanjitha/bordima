import 'package:bordima/themes/custom_colors.dart';
import 'package:bordima/views/authentication/signup_page/signup_page_event.dart';
import 'package:bordima/views/authentication/signup_page/signup_page_state.dart';
import 'package:bordima/widgets/custom_main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../widgets/custom_main_appbar.dart';
import '../../../widgets/custom_text_field.dart';
import '../signin_page/signin_page_provider.dart';
import 'signup_page_bloc.dart';

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  _SignUpPageViewState createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  final _formKey = GlobalKey<FormState>();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Phone is required'),
    EmailValidator(errorText: 'Email format is not valid.'),
  ]);
  @override
  Widget build(BuildContext context) {
    final SignUpPageBloc bloc = BlocProvider.of<SignUpPageBloc>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
            title: 'Sign In',
            tap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => SignInPageProvider()),
                  ),
                )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Let\'s create your bordima account',
                style: Theme.of(context).textTheme.headline2!.copyWith(),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      validator:
                          RequiredValidator(errorText: "Username is required"),
                      controller: bloc.firstNameTextEditingController,
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
                      controller: bloc.lastNameTextEditingController,
                      hintText: 'Last name',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      validator: emailValidator,
                      controller: bloc.emailTextEditingController,
                      prefixIconPath: 'assets/images/icons8-mail-24.png',
                      hintText: 'Email address',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      validator: passwordValidator,
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
                  Text(
                    'By signing up you accept the Terms of Service and Privacy Policy.',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 14,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  BlocBuilder<SignUpPageBloc, SignUpPageState>(
                    buildWhen: (previous, current) =>
                        previous.isLoading != current.isLoading,
                    builder: (context, state) {
                      if (state.isLoading) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: CustomColors.PRIMARY,
                              ),
                            ),
                            const Positioned(
                                child: CircularProgressIndicator(
                              color: CustomColors.BACKGROUND,
                            ))
                          ],
                        );
                      }
                      return CustomMainButton(
                          tap: () {
                            if (_formKey.currentState!.validate()) {
                              bloc.add(
                                UserSubmitDataEvent(
                                  firstName: bloc
                                      .firstNameTextEditingController.text
                                      .trim(),
                                  lastName: bloc
                                      .lastNameTextEditingController.text
                                      .trim(),
                                  email: bloc.emailTextEditingController.text
                                      .trim(),
                                  password: bloc
                                      .passwordTextEditingController.text
                                      .trim(),
                                ),
                              );
                            }
                          },
                          btnText: 'Sign Up');
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
