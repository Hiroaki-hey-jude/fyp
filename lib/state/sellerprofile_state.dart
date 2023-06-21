import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/model/post_model/post_model.dart';

import '../firebase/firestore.dart';
import '../model/crop_model.dart/crop_model.dart';
import '../model/user_model/user_model.dart';
import '../shared/constant.dart';

part 'sellerprofile_state.freezed.dart';

final sellerprofileStateProvider = StateNotifierProvider.family<
    SellerprofileStateNotifier, SellerprofileState, String>(
  (ref, sellerUid) => SellerprofileStateNotifier(sellerUid),
);

@freezed
class SellerprofileState with _$SellerprofileState {
  const factory SellerprofileState({
    @Default(false) bool isLoading,
    @Default(null) UserModel? userModel,
    @Default('') String originalImgURL,
    @Default('') String userName,
    @Default('') String sellerId,
    @Default([]) List<CropModel> sellingCrops,
    @Default([]) List<PostModel> postingList,
    @Default('販売') String selectedValue,
  }) = _SellerprofileState;
}

class SellerprofileStateNotifier extends StateNotifier<SellerprofileState> {
  SellerprofileStateNotifier(sellerUid) : super(SellerprofileState()) {
    getFarmer(sellerUid);
  }

  void changeValue(String value) {
    if (value == '販売') {
      getPostedCropList(state.userModel!.uid);
      print('${state.sellingCrops} ここの中身は何???');
    } else {
      getAgriculturalPostList();
    }
    state = state.copyWith(selectedValue: value);
  }

  Future<void> getAgriculturalPostList() async {
    state = state.copyWith(isLoading: true);
    final postModel =
        await FireStore().getAgriculturalPostedList(state.userModel!.uid);
    state = state.copyWith(
      postingList: postModel,
      isLoading: false,
    );
    print(state.postingList.length);
  }

  Future<void> getFarmer(String sellerId) async {
    state = state.copyWith(isLoading: true);
    final user = await FireStore().getCurrentUserModel(sellerId);
    state = state.copyWith(
      userName: user.name,
      userModel: user,
    );
    print('getFamerの中');
    print(state.userModel!.uid);
    getOriginalProfileUrl();
    getPostedCropList(state.userModel!.uid);
  }

  getOriginalProfileUrl() {
    String originalImgURL = state.userModel!.profilePic != ''
        ? state.userModel!.profilePic as String
        : Constant.anonymousProfilePic;
    state = state.copyWith(originalImgURL: originalImgURL, isLoading: false);
    print(state.originalImgURL + 'original image url');
  }

  Future<void> getPostedCropList(String sellerID) async {
    print('getPostedCropListの中');
    print(sellerID);
    state = state.copyWith(isLoading: true);
    final cropModel = await FireStore().getPostedCropList(sellerID);
    state = state.copyWith(
      sellingCrops: cropModel,
      isLoading: false,
    );
    print('${state.sellingCrops.length}　何個');
  }

  Future<void> buyPass(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await FireStore().buyPass(
        FirebaseAuth.instance.currentUser!.uid,
        state.userModel!.uid,
      );
    } catch (e) {
      print(e);
    } finally {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text('PASSを購入しました'),
        ),
      );
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> buyPass10000(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await FireStore().buyPass10000(
        FirebaseAuth.instance.currentUser!.uid,
        state.userModel!.uid,
      );
    } catch (e) {
      print(e);
    } finally {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text('PASSを購入しました'),
        ),
      );
    }
    state = state.copyWith(isLoading: false);
  }
}
