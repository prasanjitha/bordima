part of 'get_favorite_boarding_bloc.dart';

class GetFavoriteBoardingState {
  final List<BoardModel> favoriteBoarding;
  final bool isLoading;
  const GetFavoriteBoardingState(
      {required this.favoriteBoarding, required this.isLoading});
  static GetFavoriteBoardingState get initialState =>
      const GetFavoriteBoardingState(favoriteBoarding: [], isLoading: false);
  GetFavoriteBoardingState clone({
    List<BoardModel>? favoriteBoarding,
    bool? isLoading,
  }) {
    return GetFavoriteBoardingState(
      favoriteBoarding: favoriteBoarding ?? this.favoriteBoarding,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
