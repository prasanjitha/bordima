import 'package:bordima/views/student/favorite_boarding/get_favorite_boarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../themes/custom_colors.dart';
import '../student_main_home_page/student_main_home_page_view.dart';

class FavoriteBoardPageView extends StatefulWidget {
  const FavoriteBoardPageView({Key? key}) : super(key: key);

  @override
  _FavoriteBoardPageViewState createState() => _FavoriteBoardPageViewState();
}

class _FavoriteBoardPageViewState extends State<FavoriteBoardPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.PRIMARY,
        title: const Text("My Favorites"),
        centerTitle: true,
      ),
      body: BlocBuilder<GetFavoriteBoardingBloc, GetFavoriteBoardingState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state.favoriteBoarding.isEmpty) {
            return const Center(
              child: Text('Add your favorite boarding places'),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: state.favoriteBoarding.length,
              itemBuilder: (context, index) {
                return VerticleHotelItemCard(
                  role: 'STUDENT',
                  board: state.favoriteBoarding[index],
                  imageUrl: state.favoriteBoarding[index].images[1],
                  bordLocation: state.favoriteBoarding[index].city,
                  bordName: state.favoriteBoarding[index].boardingName,
                  priceForRoom: state.favoriteBoarding[index].boardingPrice,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
