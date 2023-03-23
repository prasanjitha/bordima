import 'package:bordima/views/bordOwner/add_boarding_page/add_boarding_page_bloc.dart';
import 'package:bordima/views/bordOwner/add_boarding_page/add_boarding_page_event.dart';
import 'package:bordima/views/bordOwner/add_boarding_page/add_boarding_page_state.dart';
import 'package:bordima/widgets/custom_main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../themes/custom_colors.dart';
import '../../../widgets/custom_line_text_field.dart';
import '../../student/student_profile_details_page/get_province/get_province_bloc.dart';

class AddBoardingPageView extends StatefulWidget {
  const AddBoardingPageView({Key? key}) : super(key: key);

  @override
  _AddBoardingPageViewState createState() => _AddBoardingPageViewState();
}

class _AddBoardingPageViewState extends State<AddBoardingPageView> {
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
  var currentSelectBoarding;
  List<String> boardingType = [
    "House",
    "Room",
  ];
  @override
  Widget build(BuildContext context) {
    AddBoardingPageBloc bloc = BlocProvider.of<AddBoardingPageBloc>(context);
    GetProvinceBloc provinceBloc = BlocProvider.of<GetProvinceBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.PRIMARY,
        title: const Text("Add boarding"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: CustomColors.BACKGROUND,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Photos',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: CustomColors.SECONDARY,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              BlocBuilder<AddBoardingPageBloc, AddBoardingPageState>(
                buildWhen: (previous, current) =>
                    previous.isLoading != current.isLoading,
                builder: (context, state) {
                  return SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.allUrls.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          if (state.isLoading) {
                            return Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: CustomColors.PRIMARY),
                              ),
                              child: const Center(
                                  child: CircularProgressIndicator(
                                color: CustomColors.PRIMARY,
                              )),
                            );
                          }
                          return InkWell(
                            onTap: () {
                              bloc.add(UploadImageEvent());
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: CustomColors.PRIMARY),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: CustomColors.PRIMARY,
                                ),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(15), // Image border
                                child: SizedBox.fromSize(
                                  // Image radius
                                  child: Image.network(
                                    state.allUrls[index],
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 10.0,
                                  top: 10.0,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        state.allUrls
                                            .remove(state.allUrls[index]);
                                      });
                                    },
                                    child: Container(
                                      width: 25.0,
                                      height: 25.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: CustomColors.BACKGROUND,
                                      ),
                                      child: const Icon(
                                        Icons.delete,
                                        color: CustomColors.ERROR,
                                        size: 20.0,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomLineTextField(
                      textEditingController:
                          bloc.boardingNameTextEditingController,
                      title: 'Boarding Name',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Select province',
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
                                  BorderSide(color: CustomColors.SECONDARY),
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
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomLineTextField(
                      textEditingController: bloc.cityTextEditingController,
                      title: 'City',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomLineTextField(
                      textEditingController: bloc.mobileTextEditingController,
                      title: 'Mobile',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Boarding Type',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
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
                                        borderSide: BorderSide(
                                            color: CustomColors.SECONDARY),
                                      ),
                                      errorStyle:
                                          const TextStyle(fontSize: 0.012),
                                      hintText: '',
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.fromLTRB(1, 2, 0, 0),
                                      hintStyle:
                                          Theme.of(context).textTheme.subtitle1,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: CustomColors.PRIMARY,
                                            width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        hint: Text(
                                          '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                        value: currentSelectBoarding,
                                        isDense: true,
                                        isExpanded: true,
                                        onChanged: (String? newValue) {
                                          setState(
                                            () {
                                              currentSelectBoarding = newValue!;
                                              context
                                                  .read<GetProvinceBloc>()
                                                  .add(GetMyBoardingTypeEvent(
                                                      currentSelectBoarding));
                                            },
                                          );
                                        },
                                        items: boardingType.map((String value) {
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: CustomLineTextField(
                            textEditingController:
                                bloc.priceTextEditingController,
                            title: 'Price',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomLineTextField(
                      textEditingController:
                          bloc.descriptionTextEditingController,
                      title: 'Description',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BlocBuilder<GetProvinceBloc, GetProvinceState>(
                      buildWhen: (previous, current) =>
                          previous.boardingType != current.boardingType,
                      builder: (context, state) {
                        return CustomMainButton(
                          tap: () {
                            bloc.add(SubmitBoardingData(
                              boardingName: bloc
                                  .boardingNameTextEditingController.text
                                  .trim(),
                              boardingPrice:
                                  bloc.priceTextEditingController.text.trim(),
                              boardingType: provinceBloc.state.boardingType,
                              city: bloc.cityTextEditingController.text.trim(),
                              description: bloc
                                  .descriptionTextEditingController.text
                                  .trim(),
                              images: bloc.state.allUrls,
                              mobile:
                                  bloc.mobileTextEditingController.text.trim(),
                              province: provinceBloc.state.province,
                            ));
                          },
                          btnText: 'Add',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
