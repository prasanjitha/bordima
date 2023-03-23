import 'package:bordima/themes/custom_colors.dart';
import 'package:bordima/views/student/student_main_home_page/student_main_home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/boarding.dart';
import '../../../widgets/custom_carousel_slider.dart';
import '../../../widgets/custom_searchbar.dart';
import '../../../widgets/custom_student_title.dart';
import '../../bordOwner/boarding_details_page/boarding_details_page_view.dart';
import '../student_boarding_details_page/student_boarding_details_page_provider.dart';
import '../student_profile_details_page/student_profile_details_page_bloc.dart';
import 'student_main_home_page_bloc.dart';

class StudentMainHomePageView extends StatefulWidget {
  const StudentMainHomePageView({Key? key}) : super(key: key);

  @override
  _StudentMainHomePageViewState createState() =>
      _StudentMainHomePageViewState();
}

class _StudentMainHomePageViewState extends State<StudentMainHomePageView> {
  @override
  Widget build(BuildContext context) {
    final StudentMainHomePageBloc bloc =
        BlocProvider.of<StudentMainHomePageBloc>(context);
    final StudentProDetailsPageBloc stuBloc =
        BlocProvider.of<StudentProDetailsPageBloc>(context);
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CustomStudentTitle(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustoSearchBar(width: width),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            CustomCarouselSlider(
              items: const [
                'https://www.lankapropertyweb.com/pics/5414157/thumb_5414157_1673253946_7137.jpeg',
                'https://www.hiusa.org/wp-content/uploads/2020/04/Hostel-Group-HI-SF-Downtown-1000x550-compressor-778x446.jpg',
                'http://myfunkytravel.com/wp-content/uploads/2015/08/staying-in-hostels-guide-min.jpg',
                'http://thehostelgirl.com/wp-content/uploads/2016/03/Dorm-Rooms-vs-Private-Rooms-in-a-Hostel-5-1024x682.jpg',
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nearest bording ',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  BlocBuilder<StudentMainHomePageBloc,
                      StudentMainHomePageState>(
                    buildWhen: (previous, current) =>
                        previous.isLoading != current.isLoading,
                    builder: (context, state) {
                      return SizedBox(
                        height: 200.0,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.allBoarding.length,
                            itemBuilder: (context, index) {
                              return HorizontalBordCard(
                                tap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          StudentBoardingDetailsPageProvider(
                                              board: state.allBoarding[index])),
                                    ),
                                  );
                                },
                                imageUrl: state.allBoarding[index].images[1],
                                bordName: state.allBoarding[index].boardingName,
                                bordLocation: state.allBoarding[index].city,
                              );
                            }),
                      );
                    },
                  ),
                  Text(
                    'All bording ',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  BlocBuilder<StudentMainHomePageBloc,
                      StudentMainHomePageState>(
                    buildWhen: (previous, current) =>
                        previous.isLoading != current.isLoading,
                    builder: (context, state) {
                      return SizedBox(
                        height: 1000.0,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.allBoarding.length,
                          itemBuilder: (context, index) {
                            return VerticleHotelItemCard(
                              role: 'STUDENT',
                              board: state.allBoarding[index],
                              imageUrl: state.allBoarding[index].images[1],
                              bordLocation: state.allBoarding[index].city,
                              bordName: state.allBoarding[index].boardingName,
                              priceForRoom:
                                  state.allBoarding[index].boardingPrice,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerticleHotelItemCard extends StatelessWidget {
  final bool isAvailable;
  final String imageUrl;
  final String bordName;
  final String bordLocation;
  final String priceForRoom;
  final bool isBordigOwner;
  final BoardModel board;
  final String role;

  const VerticleHotelItemCard({
    this.isAvailable = true,
    required this.bordLocation,
    required this.bordName,
    required this.imageUrl,
    required this.priceForRoom,
    this.isBordigOwner = false,
    required this.board,
    this.role = 'BOARDING_OWNER',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        width: width,
        height: 125.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 6), // changes position of shadow
            ),
          ],
          color: CustomColors.BACKGROUND,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ), // Image border
              child: SizedBox.fromSize(
                // Image radius
                child: Image.network(
                  imageUrl,
                  width: 100.0,
                  height: 125.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 130,
                        child: Text(
                          bordName,
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    fontSize: 18,
                                  ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      AvailableButton(isAvailable: isAvailable),
                    ],
                  ),
                  Text(
                    bordLocation,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 14,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Rs$priceForRoom/room',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                  isBordigOwner
                      ? Row(
                          children: [
                            const SizedBox(width: 110.0),
                            ViewDetailsButton(
                              role: role,
                              board: board,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            ViewDetailsButton(
                              role: role,
                              board: board,
                            ),
                            const SizedBox(width: 20.0),
                            BookNowButton(
                              isAvailable: isAvailable,
                            ),
                          ],
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ViewDetailsButton extends StatelessWidget {
  final BoardModel board;
  final String role;
  const ViewDetailsButton({
    required this.board,
    this.role = 'BOARDING_OWNER',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => role == 'STUDENT'
                ? StudentBoardingDetailsPageProvider(board: board)
                : BoardingDetailsPageView(
                    board: board,
                  )),
          ),
        );
      },
      child: Container(
        width: 90,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: CustomColors.PRIMARY,
            )),
        child: Center(
          child: Text(
            'Details',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 14,
                  color: CustomColors.PRIMARY,
                ),
          ),
        ),
      ),
    );
  }
}

class BookNowButton extends StatelessWidget {
  final bool isAvailable;
  const BookNowButton({
    this.isAvailable = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isAvailable
        ? Container(
            width: 90,
            height: 30,
            decoration: BoxDecoration(
              color: CustomColors.PRIMARY,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Text(
                'Book Now',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 14,
                      color: CustomColors.BACKGROUND,
                    ),
              ),
            ),
          )
        : Container(
            width: 90,
            height: 30,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 173, 235, 202),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Text(
                'Book Now',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 247, 241, 241),
                    ),
              ),
            ),
          );
  }
}

class AvailableButton extends StatelessWidget {
  bool isAvailable;
  AvailableButton({
    this.isAvailable = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 20,
      decoration: BoxDecoration(
        color: isAvailable ? CustomColors.PRIMARY : CustomColors.ERROR,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Text(
          isAvailable ? 'Available' : 'Not',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontSize: 10,
                color: CustomColors.BACKGROUND,
              ),
        ),
      ),
    );
  }
}

class HorizontalBordCard extends StatelessWidget {
  final String imageUrl;
  final String bordName;
  final String bordLocation;
  final VoidCallback tap;
  const HorizontalBordCard({
    required this.bordLocation,
    required this.bordName,
    required this.imageUrl,
    required this.tap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, bottom: 20),
      child: InkWell(
        onTap: tap,
        child: Container(
          width: 135,
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: CustomColors.BACKGROUND,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 6), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ), // Image border
                child: SizedBox.fromSize(
                  // Image radius
                  child: Image.network(
                    imageUrl,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bordName,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontSize: 14,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      bordLocation,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontSize: 14,
                            color: CustomColors.SECONDARY,
                          ),
                      overflow: TextOverflow.ellipsis,
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
