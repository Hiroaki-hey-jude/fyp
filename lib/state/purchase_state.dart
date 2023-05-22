import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../firebase/auth.dart';
import '../firebase/firestore.dart';
import '../model/crop_model.dart/crop_model.dart';
import '../model/user_model/user_model.dart';
import '../sharedpreference/sharedpreference.dart';

part 'purchase_state.freezed.dart';

final purchaseStateProvider =
    StateNotifierProvider.family<PurchaseStateNotifier, PurchaseState, String>(
  (ref, cropId) => PurchaseStateNotifier(cropId),
);

@freezed
class PurchaseState with _$PurchaseState {
  const factory PurchaseState({
    @Default(false) bool isLoading,
    @Default(null) CropModel? cropModel,
    @Default(null) UserModel? userModel,
  }) = _Purchasetate;
}

class PurchaseStateNotifier extends StateNotifier<PurchaseState> {
  PurchaseStateNotifier(cropId) : super(const PurchaseState()) {
    getPotentialPurchaseCropData(cropId);
  }

  Future<void> getPotentialPurchaseCropData(String cropId) async {
    state = state.copyWith(isLoading: true);
    print('hee');
    print(cropId);
    final cropModel = await FireStore().getPotentialCropData(cropId);
    state = state.copyWith(cropModel: cropModel);
    // print(state.cropModel!.name);
    getCurrentUserModel(FirebaseAuth.instance.currentUser!.uid);
    state = state.copyWith(isLoading: false);
  }

  Future<void> getCurrentUserModel(String uid) async {
    final userModel = await FireStore().getCurrentUserModel(uid);
    state = state.copyWith(userModel: userModel);
    print(state.userModel!.name);
  }

  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
  }
}
