import 'package:flutter/foundation.dart';

@immutable
class AddBoardingPageState {
  final String error;
  final String imageUrl;
  final bool isLoading;
  final List<String> allUrls;
  const AddBoardingPageState({
    required this.error,
    required this.imageUrl,
    required this.isLoading,
    required this.allUrls,
  });

  static AddBoardingPageState get initialState {
    return const AddBoardingPageState(
        error: '',
        imageUrl: '',
        isLoading: false,
        allUrls: [
          'https://cdn.pixabay.com/photo/2017/08/06/12/06/people-2591874_960_720.jpg'
        ]);
  }

  AddBoardingPageState clone({
    String? error,
    String? imageUrl,
    bool? isLoading,
    List<String>? allUrls,
  }) {
    return AddBoardingPageState(
      error: error ?? this.error,
      imageUrl: imageUrl ?? this.imageUrl,
      isLoading: isLoading ?? this.isLoading,
      allUrls: allUrls ?? this.allUrls,
    );
  }
}
