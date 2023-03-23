part of 'get_favorite_boarding_bloc.dart';

abstract class GetFavoriteBoardingEvent {}

class AddFavoriteBoardingEvent extends GetFavoriteBoardingEvent {
  final BoardModel favBoarding;
  AddFavoriteBoardingEvent({required this.favBoarding});
}

class RemoveFavoriteBoardingEvent extends GetFavoriteBoardingEvent {
  final BoardModel favBoarding;
  RemoveFavoriteBoardingEvent({required this.favBoarding});
}
