import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../firebase/firestore.dart';
import '../model/crop_model.dart/crop_model.dart';
import '../model/user_model/user_model.dart';
import '../shared/constant.dart';

part 'sellerprofile_state.freezed.dart';

final sellerprofileStateProvider =
    StateNotifierProvider<SellerprofileStateNotifier, SellerprofileState>(
  (ref) => SellerprofileStateNotifier(),
);

@freezed
class SellerprofileState with _$SellerprofileState {
  const factory SellerprofileState({
    @Default(false) bool isLoading,
    @Default(null) UserModel? userModel,
    @Default('') String originalImgURL,
    @Default('') String userName,
    @Default([]) List<CropModel> sellingCrops,
  }) = _SellerprofileState;
}

class SellerprofileStateNotifier extends StateNotifier<SellerprofileState> {
  SellerprofileStateNotifier() : super(const SellerprofileState()) {
    getUser();
  }
  Future<void> getUser() async {
    state = state.copyWith(isLoading: true);
    final user = await FireStore()
        .getCurrentUserModel(FirebaseAuth.instance.currentUser!.uid);
    state = state.copyWith(
      userName: user.name,
      userModel: user,
    );
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
    state = state.copyWith(isLoading: true);
    final cropModel = await FireStore().getPostedCropList(sellerID);
    state = state.copyWith(
      sellingCrops: cropModel,
      isLoading: false,
    );
  }
}
