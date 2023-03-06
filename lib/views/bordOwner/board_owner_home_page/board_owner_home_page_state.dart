import 'package:bordima/models/boarding.dart';
import 'package:flutter/foundation.dart';

@immutable
class BDOwnerHomePageState {
  final String error;
  final bool isLoading;
  final List<BoardModel> allBoarding;

  const BDOwnerHomePageState({
    required this.error,
    required this.isLoading,
    required this.allBoarding,
  });

  static BDOwnerHomePageState get initialState {
    return const BDOwnerHomePageState(
        error: '', isLoading: false, allBoarding: []);
  }

  BDOwnerHomePageState clone({
    String? error,
    bool? isLoading,
    List<BoardModel>? allBoarding,
  }) {
    return BDOwnerHomePageState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      allBoarding: allBoarding ?? this.allBoarding,
    );
  }
}
