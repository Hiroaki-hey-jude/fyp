

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../firebase/auth.dart';
import '../firebase/firestore.dart';
import '../model/address_model/address_model.dart';
import '../model/crop_model.dart/crop_model.dart';
import '../model/user_model/user_model.dart';
import '../sharedpreference/sharedpreference.dart';

part 'purchase_state.freezed.dart';

final purchaseStateProvider = StateNotifierProvider.autoDispose
    .family<PurchaseStateNotifier, PurchaseState, String>(
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

  Future<void> purchaseCrop(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    await FireStore().purchaseCrop(
      state.userModel!.coins,
      state.cropModel!.price,
      state.userModel!.uid,
      state.cropModel!.cropId,
      state.cropModel!.sellerId,
      state.userModel!,
      state.cropModel!,
      context
    );
    state = state.copyWith(isLoading: false);
  }

  Future<void> storeAddressData(
    String zipCode,
    String prefecture,
    String city,
    String number,
  ) async {
    state = state.copyWith(isLoading: true);
    await FireStore().storeAddressData(
      zipCode,
      prefecture,
      city,
      number,
      FirebaseAuth.instance.currentUser!.uid,
    );
    var updatedAddressModel = AddressModel(
      zipCode: zipCode,
      prefecture: prefecture,
      city: city,
      number: number,
    );
    // state = state.copyWith(userModel: UserModel(address: address));
    state = state.copyWith(
      isLoading: false,
      userModel: UserModel(
        coins: state.userModel!.coins,
        email: state.userModel!.email,
        address: updatedAddressModel,
        name: state.userModel!.name,
        profilePic: state.userModel!.profilePic,
        uid: state.userModel!.uid,
      ),
    );
  }
}
