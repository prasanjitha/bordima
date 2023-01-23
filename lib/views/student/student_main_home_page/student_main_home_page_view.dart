import 'package:bordima/themes/custom_colors.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_carousel_slider.dart';
import '../../../widgets/custom_searchbar.dart';
import '../../../widgets/custom_student_title.dart';
import '../bording_details_page/bording_details_page_view.dart';

class StudentMainHomePageView extends StatefulWidget {
  const StudentMainHomePageView({Key? key}) : super(key: key);

  @override
  _StudentMainHomePageViewState createState() =>
      _StudentMainHomePageViewState();
}

class _StudentMainHomePageViewState extends State<StudentMainHomePageView> {
  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                    height: 200.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        HorizontalBordCard(
                          imageUrl:
                              'https://cf.bstatic.com/xdata/images/hotel/max1024x768/214023022.jpg?k=3370b2938d32c9e4974f5d74de0a9ed6b2e6f855f9c802f8ce2d5bb93ff1feb5&o=&hp=1',
                          bordName: 'Sagara bording',
                          bordLocation: 'Moratuwa',
                        ),
                        HorizontalBordCard(
                          imageUrl:
                              'https://www.valleyviewcasino.com/wp-content/uploads/Hero-Deluxe-Room-final.jpg',
                          bordName: 'Namal bording',
                          bordLocation: 'Piliyandala',
                        ),
                        HorizontalBordCard(
                          imageUrl:
                              'https://compote.slate.com/images/3a80009e-24e2-4bf0-9cd0-99ef4d4a5255.jpg?height=346&width=568',
                          bordName: 'Kishan bording',
                          bordLocation: 'Dehiwala',
                        ),
                        HorizontalBordCard(
                          imageUrl:
                              'https://cf.bstatic.com/xdata/images/hotel/max1024x768/214023022.jpg?k=3370b2938d32c9e4974f5d74de0a9ed6b2e6f855f9c802f8ce2d5bb93ff1feb5&o=&hp=1',
                          bordName: 'Sihansi bording',
                          bordLocation: 'Moratuwa',
                        ),
                      ],
                    ),
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
                  const VerticleHotelItemCard(
                    imageUrl:
                        'https://thumbs.dreamstime.com/b/hotel-room-beautiful-orange-sofa-included-43642330.jpg',
                    bordLocation: 'Moratuwa',
                    bordName: 'Sithmi bording',
                    priceForRoom: '5000',
                  ),
                  const VerticleHotelItemCard(
                    imageUrl:
                        'https://2.imimg.com/data2/SI/TS/MY-3125576/lemon_tree_hotel_single-room-500x500.jpg',
                    bordLocation: 'Piliyandala',
                    bordName: 'Shenu bording',
                    priceForRoom: '6000',
                    isAvailable: false,
                  ),
                  const VerticleHotelItemCard(
                    imageUrl:
                        'https://viatravelers.com/wp-content/uploads/2021/01/single-hotel-room.jpg.webp',
                    bordLocation: 'Piliyandala',
                    bordName: 'Vishmi bording',
                    priceForRoom: '6000',
                    isAvailable: true,
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

  const VerticleHotelItemCard({
    this.isAvailable = true,
    required this.bordLocation,
    required this.bordName,
    required this.imageUrl,
    required this.priceForRoom,
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
                  Row(
                    children: [
                      const ViewDetailsButton(),
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
  const ViewDetailsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const BordingDetailsPageView()),
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
  const HorizontalBordCard({
    required this.bordLocation,
    required this.bordName,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, bottom: 20),
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
    );
  }
}
