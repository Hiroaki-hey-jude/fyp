import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/firebase/firestore.dart';
import 'package:fyp/model/crop_model.dart/crop_model.dart';
import 'package:fyp/model/pass_model/pass_model.dart';
import 'package:fyp/state/purchase_state.dart';

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
    @Default('potato') String selectedCategory,
    @Default([]) List<CropModel> selectedCategoryCrops,
    @Default([]) List<PassModel> purchasedPasses,
  }) = _CropState;
}

class CropStateNotifier extends StateNotifier<CropState> {
  CropStateNotifier() : super(const CropState()) {
    getInitCropData();
    getDiscount(FirebaseAuth.instance.currentUser!.uid);
  }

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
    getSelectedCategory(title);
  }

  Future<void> getSelectedCategory(String category) async {
    final selectedCropData = await FireStore().getCropDocument(category);
    state = state.copyWith(selectedCategoryCrops: selectedCropData);
  }

  Future<void> getInitCropData() async {
    final potatoCropData = await FireStore().getInitCropDocument();
    state = state.copyWith(selectedCategoryCrops: potatoCropData);
  }

  Future<void> getDiscount(String uid) async {
    state = state.copyWith(isLoading: true);
    final listOfPasses = await FireStore().getDiscount(uid);
    state = state.copyWith(
      isLoading: false,
      purchasedPasses: listOfPasses,
    );
    print(state.purchasedPasses.length);
  }
}
