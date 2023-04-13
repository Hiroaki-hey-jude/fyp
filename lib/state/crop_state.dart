import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../firebase/auth.dart';
import '../model/user_model/user_model.dart';
import '../sharedpreference/sharedpreference.dart';

part 'crop_state.freezed.dart';

final cropStateProvider = StateNotifierProvider<CropStateNotifier, CropState>(
  (ref) => CropStateNotifier(),
);

@freezed
class CropState with _$CropState {
  const factory CropState({
    @Default(false) bool isLoading,
    @Default(0) int selectedIndex,
    @Default(0) int selectedIndexForOutlineButton,
  }) = _CropState;
}

class CropStateNotifier extends StateNotifier<CropState> {
  CropStateNotifier() : super(const CropState());
  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
  }

  void onItemTapped(int index) {
    state = state.copyWith(
      selectedIndex: index,
    );
  }

  void onCategoryButtonTap(String title) {
    if (title == 'potato') {
      state = state.copyWith(
        selectedIndexForOutlineButton: 0,
      );
    } else if (title == 'rice') {
      state = state.copyWith(
        selectedIndexForOutlineButton: 1,
      );
    } else if (title == 'tomato') {
      state = state.copyWith(
        selectedIndexForOutlineButton: 2,
      );
    } else {
      state = state.copyWith(
        selectedIndexForOutlineButton: 3,
      );
    }
  }
}
