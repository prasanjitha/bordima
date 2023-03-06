import 'package:bordima/models/boarding.dart';
import 'package:flutter/foundation.dart';

@immutable
class SearchBoardPageState {
  final String error;
  final bool isLoading;
  final List<BoardModel> searchBoard;
  final List<BoardModel> foundBoard;

  const SearchBoardPageState({
    required this.error,
    required this.isLoading,
    required this.searchBoard,
    required this.foundBoard,
  });

  static SearchBoardPageState get initialState {
    return const SearchBoardPageState(
        error: '', isLoading: false, searchBoard: [], foundBoard: []);
  }

  SearchBoardPageState clone({
    String? error,
    bool? isLoading,
    List<BoardModel>? searchBoard,
    List<BoardModel>? foundBoard,
  }) {
    return SearchBoardPageState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      searchBoard: searchBoard ?? this.searchBoard,
      foundBoard: foundBoard ?? this.foundBoard,
    );
  }
}
