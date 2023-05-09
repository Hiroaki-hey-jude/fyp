import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/model/crop_model.dart/crop_model.dart';

import '../firebase/auth.dart';
import '../firebase/firestore.dart';
import '../model/user_model/user_model.dart';
import '../sharedpreference/sharedpreference.dart';

part 'buy_state.freezed.dart';

final buyStateProvider =
    StateNotifierProvider.family<BuyStateNotifier, BuyState, String>(
  (ref, cropId) => BuyStateNotifier(cropId),
);

@freezed
class BuyState with _$BuyState {
  const factory BuyState({
    @Default(false) bool isLoading,
    @Default('') String cropId,
    @Default(null) CropModel? cropModel,
    @Default(null) UserModel? userModel,
    @Default(false) bool isPictureTwoVisible,
    @Default(false) bool isPictureThreeVisible,
    @Default('') String bigPicture,
  }) = _BuyState;
}

class BuyStateNotifier extends StateNotifier<BuyState> {
  BuyStateNotifier(cropId) : super(const BuyState()) {
    getPotentialPurchaseCropData(cropId);
  }
  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
  }

  Future<void> getPotentialPurchaseCropData(String cropId) async {
    state = state.copyWith(isLoading: true);
    final cropModel = await FireStore().getPotentialCropData(cropId);
    getUserModelBuyScreen(cropModel.sellerId);
    state = state.copyWith(cropModel: cropModel);
    if (state.cropModel!.picsOfCrops!.length >= 2) {
      state = state.copyWith(isPictureTwoVisible: true);
      if (state.cropModel!.picsOfCrops!.length >= 3) {
        state = state.copyWith(isPictureThreeVisible: true);
      }
    }
    state =
        state.copyWith(isLoading: false, bigPicture: cropModel.picsOfCrops![0]);
  }

  Future<void> getUserModelBuyScreen(String uid) async {
    state = state.copyWith(isLoading: true);
    final userModel = await FireStore().getUserModelForBuy(uid);
    state = state.copyWith(
      userModel: userModel,
      isLoading: false,
    );
  }

  void changeBigPicture(int number) {
    print('hsaldifhalsejf');
    state = state.copyWith(bigPicture: state.cropModel!.picsOfCrops![number]);
  }
}