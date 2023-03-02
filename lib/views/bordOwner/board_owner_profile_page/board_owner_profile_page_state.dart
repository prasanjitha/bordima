import 'package:flutter/foundation.dart';

@immutable
class BWProfilePageState {
  final String error;
  final bool isLoading;
  final String imageUrl;

  const BWProfilePageState({
    required this.error,
    required this.isLoading,
    required this.imageUrl,
  });

  static BWProfilePageState get initialState {
    return const BWProfilePageState(error: '', isLoading: false, imageUrl: '');
  }

  BWProfilePageState clone({
    String? error,
    bool? isLoading,
    String? imageUrl,
  }) {
    return BWProfilePageState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
