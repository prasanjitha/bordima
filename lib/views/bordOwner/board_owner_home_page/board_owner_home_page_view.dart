import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'board_owner_home_page_bloc.dart';
import '../../../widgets/custom_searchbar.dart';
import '../../../widgets/custom_carousel_slider.dart';
import 'package:bordima/widgets/custom_board_owner_title.dart';
import '../../student/student_main_home_page/student_main_home_page_view.dart';
import 'package:bordima/views/bordOwner/board_owner_home_page/board_owner_home_page_state.dart';

class BDOwnerHomePageView extends StatefulWidget {
  const BDOwnerHomePageView({Key? key}) : super(key: key);

  @override
  _BDOwnerHomePageViewState createState() => _BDOwnerHomePageViewState();
}

class _BDOwnerHomePageViewState extends State<BDOwnerHomePageView> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    BDOwnerHomePageBloc bloc = BlocProvider.of<BDOwnerHomePageBloc>(context);
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
                  const CustomBoardOwnerTitle(),
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
                  BlocBuilder<BDOwnerHomePageBloc, BDOwnerHomePageState>(
                    buildWhen: (previous, current) =>
                        previous.isLoading != current.isLoading,
                    builder: (context, state) {
                      return SizedBox(
                        height: 1500.0,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.allBoarding.length,
                          itemBuilder: (context, index) {
                            return VerticleHotelItemCard(
                              isBordigOwner: true,
                              imageUrl: state.allBoarding[index].images[1],
                              bordLocation: state.allBoarding[index].city,
                              bordName: state.allBoarding[index].boardingName,
                              priceForRoom:
                                  state.allBoarding[index].boardingPrice,
                              board: state.allBoarding[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
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
