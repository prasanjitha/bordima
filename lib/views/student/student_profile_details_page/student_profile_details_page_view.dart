import 'package:bordima/themes/custom_colors.dart';
import 'package:bordima/widgets/custom_main_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../authentication/signin_page/signin_page_provider.dart';

class StudentProDetailsPageView extends StatefulWidget {
  const StudentProDetailsPageView({Key? key}) : super(key: key);

  @override
  _StudentProDetailsPageViewState createState() =>
      _StudentProDetailsPageViewState();
}

class _StudentProDetailsPageViewState extends State<StudentProDetailsPageView> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.PRIMARY,
          title: const Text("My Profile"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                FirebaseAuth auth = FirebaseAuth.instance;
                await auth.signOut();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => SignInPageProvider()),
                  ),
                );
              },
              icon: const Icon(
                Icons.logout,
                color: CustomColors.BACKGROUND,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(alignment: Alignment.center, children: [
                  Container(
                    width: width,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80), // Image border
                    child: SizedBox.fromSize(
                      // Image radius
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2018/03/12/12/32/woman-3219507_960_720.jpg',
                        width: 160.0,
                        height: 160.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                      right: 20,
                      child: Icon(
                        Icons.edit,
                        color: CustomColors.PRIMARY,
                      ))
                ]),
                Column(
                  children: const [
                    CustomLineInputField(
                      lable: 'First Name',
                      hintText: 'Mr.Sagara',
                    ),
                    CustomLineInputField(
                      lable: 'Last Name',
                      hintText: 'Rathnayake',
                    ),
                    CustomLineInputField(
                      lable: 'Province',
                      hintText: 'Westren Province',
                    ),
                    CustomLineInputField(
                      lable: 'City',
                      hintText: 'Kalutara',
                    ),
                    CustomLineInputField(
                      lable: 'Mobile',
                      hintText: '+94 768934456',
                    ),
                    CustomLineInputField(
                      lable: 'Email',
                      hintText: 'sagara45@gmail.com',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomMainButton(tap: () {}, btnText: 'Update')
              ],
            ),
          ),
        ));
  }
}

class CustomLineInputField extends StatelessWidget {
  final String lable;
  final String hintText;
  const CustomLineInputField({
    required this.hintText,
    required this.lable,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   lable,
        //   style: Theme.of(context).textTheme.headline4!.copyWith(
        //         fontSize: 16,
        //       ),
        // ),
        TextFormField(
          maxLength: 15,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
