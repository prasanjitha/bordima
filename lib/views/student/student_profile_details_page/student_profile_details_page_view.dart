import 'package:bordima/themes/custom_colors.dart';
import 'package:bordima/views/student/student_profile_details_page/student_profile_details_page_event.dart';
import 'package:bordima/views/student/student_profile_details_page/student_profile_details_page_state.dart';
import 'package:bordima/widgets/custom_main_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/signin_page/signin_page_provider.dart';
import 'get_province/get_province_bloc.dart';
import 'student_profile_details_page_bloc.dart';

class StudentProDetailsPageView extends StatefulWidget {
  const StudentProDetailsPageView({Key? key}) : super(key: key);

  @override
  _StudentProDetailsPageViewState createState() =>
      _StudentProDetailsPageViewState();
}

class _StudentProDetailsPageViewState extends State<StudentProDetailsPageView> {
  var currentSelectedValue;
  List<String> gender = [
    "Central Province",
    "Eastern Province",
    "Northern Province",
    "Southern Province",
    "Western Province",
    "North Western Province",
    "North Central Province ",
    "Uva Province ",
    "Sabaragamuwa Province",
  ];
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final StudentProDetailsPageBloc bloc =
        BlocProvider.of<StudentProDetailsPageBloc>(context);
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
                  BlocBuilder<StudentProDetailsPageBloc,
                      StudentProDetailsPageState>(
                    buildWhen: (previous, current) =>
                        previous.isLoading != current.isLoading,
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state.imageUrl.isNotEmpty) {
                        return ClipRRect(
                          borderRadius:
                              BorderRadius.circular(80), // Image border
                          child: SizedBox.fromSize(
                            // Image radius
                            child: Image.network(
                              state.imageUrl,
                              width: 160.0,
                              height: 160.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                      return InkWell(
                        onTap: () {
                          bloc.add(UploadImageEvent());
                        },
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(80), // Image border
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
                      );
                    },
                  ),
                  Positioned(
                      right: 20,
                      child: InkWell(
                        onTap: () {
                          bloc.add(UploadImageEvent());
                        },
                        child: const Icon(
                          Icons.edit,
                          color: CustomColors.PRIMARY,
                        ),
                      ))
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomLineInputField(
                      textEditingController:
                          bloc.firstNameTextEditingController,
                      lable: 'First Name',
                      hintText: 'Mr.Sagara',
                    ),
                    CustomLineInputField(
                      textEditingController: bloc.lastNameTextEditingController,
                      lable: 'Last Name',
                      hintText: 'Rathnayake',
                    ),
                    Text(
                      'Update your province',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontSize: 16.0,
                            color: CustomColors.SECONDARY,
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.start,
                    ),
                    BlocBuilder<GetProvinceBloc, GetProvinceState>(
                      builder: (context, state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColors.PRIMARY),
                            ),
                            errorStyle: const TextStyle(fontSize: 0.012),
                            hintText: '',
                            isDense: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(1, 2, 0, 0),
                            hintStyle: Theme.of(context).textTheme.subtitle1,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: CustomColors.PRIMARY, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text(
                                '',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              value: currentSelectedValue,
                              isDense: true,
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(
                                  () {
                                    currentSelectedValue = newValue!;
                                    context.read<GetProvinceBloc>().add(
                                        GetMyProvinceEvent(
                                            currentSelectedValue));
                                  },
                                );
                              },
                              items: gender.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                    // CustomLineInputField(
                    //   textEditingController: bloc.provinceTextEditingController,
                    //   lable: 'Province',
                    //   hintText: 'Westren Province',
                    // ),
                    CustomLineInputField(
                      maxLength: 20,
                      textEditingController: bloc.townTextEditingController,
                      lable: 'City',
                      hintText: 'Kalutara',
                    ),
                    // CustomLineInputField(

                    //   lable: 'Mobile',
                    //   hintText: '+94 768934456',
                    // ),
                    CustomLineInputField(
                      textEditingController: bloc.emailTextEditingController,
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
  final int maxLength;
  final TextEditingController textEditingController;
  const CustomLineInputField({
    required this.hintText,
    required this.lable,
    required this.textEditingController,
    this.maxLength = 15,
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
          controller: textEditingController,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
