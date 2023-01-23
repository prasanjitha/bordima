import 'package:bordima/views/authentication/forgot_password_page/check_email_page.dart';
import 'package:bordima/widgets/custom_main_button.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../widgets/custom_main_appbar.dart';
import '../../../widgets/custom_text_field.dart';

class ForgotPasswordPageView extends StatefulWidget {
  const ForgotPasswordPageView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageViewState createState() => _ForgotPasswordPageViewState();
}

class _ForgotPasswordPageViewState extends State<ForgotPasswordPageView> {
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
          tap: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot password',
                  style: Theme.of(context).textTheme.headline2!.copyWith(),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Enter your email and we’ll send you instructions on how to reset your password.',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 14,
                      ),
                ),
              ],
            ),

            // Image.asset('assets/images/undraw_access_account_re_8spm.png'),
            Form(
              key: _formKey,
              child: Column(
                children: [
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
                ],
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),
            CustomMainButton(
                tap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => CheckEmailPage()),
                    ),
                  );
                },
                btnText: 'Recover password'),
          ],
        ),
      ),
    );
  }
}
