import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../themes/custom_colors.dart';
import '../../../widgets/custom_carousel_slider.dart';
import '../../../widgets/custom_searchbar.dart';
import '../../../widgets/custom_student_title.dart';
import '../../authentication/signin_page/signin_page_provider.dart';
import '../../student/student_main_home_page/student_main_home_page_view.dart';

class BDOwnerHomePageView extends StatefulWidget {
  const BDOwnerHomePageView({Key? key}) : super(key: key);

  @override
  _BDOwnerHomePageViewState createState() => _BDOwnerHomePageViewState();
}

class _BDOwnerHomePageViewState extends State<BDOwnerHomePageView> {
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
                    'All bording ',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const VerticleHotelItemCard(
                    isBordigOwner: true,
                    imageUrl:
                        'https://thumbs.dreamstime.com/b/hotel-room-beautiful-orange-sofa-included-43642330.jpg',
                    bordLocation: 'Moratuwa',
                    bordName: 'Sithmi bording',
                    priceForRoom: '5000',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const VerticleHotelItemCard(
                    isBordigOwner: true,
                    isAvailable: false,
                    imageUrl:
                        'https://thumbs.dreamstime.com/b/hotel-room-beautiful-orange-sofa-included-43642330.jpg',
                    bordLocation: 'Moratuwa',
                    bordName: 'Sithmi bording',
                    priceForRoom: '5000',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const VerticleHotelItemCard(
                    isBordigOwner: true,
                    imageUrl:
                        'https://thumbs.dreamstime.com/b/hotel-room-beautiful-orange-sofa-included-43642330.jpg',
                    bordLocation: 'Moratuwa',
                    bordName: 'Sithmi bording',
                    priceForRoom: '5000',
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
