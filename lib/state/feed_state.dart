import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/model/post_model/post_model.dart';

import '../firebase/auth.dart';
import '../firebase/firestore.dart';
import '../model/user_model/user_model.dart';
import '../sharedpreference/sharedpreference.dart';

part 'feed_state.freezed.dart';

final feedStateProvider = StateNotifierProvider<FeedStateNotifier, FeedState>(
  (ref) => FeedStateNotifier(),
);

@freezed
class FeedState with _$FeedState {
  const factory FeedState({
    @Default(false) bool isLoading,
    @Default([]) List<PostModel> listOfPost,
    // @Default(false) bool isPictureTwoVisible,
    // @Default(false) bool isPictureThreeVisible,
  }) = _FeedState;
}

class FeedStateNotifier extends StateNotifier<FeedState> {
  FeedStateNotifier() : super(const FeedState()) {
    getAgriculturalPostList();
  }
  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
  }

  Future<void> getAgriculturalPostList() async {
    state = state.copyWith(isLoading: true);
    final postModel = await FireStore().getAllAgriculturalPostedList();
    state = state.copyWith(
      listOfPost: postModel,
      isLoading: false,
    );
  }

  double determineContainerHeight(int textLength, BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    if (textLength < 50) {
      return 100.0;
    } else if (textLength < 100) {
      return 150.0;
    } else {
      return 200.0;
    }
  }
}
