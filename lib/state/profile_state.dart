import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/firebase/firestore.dart';
import 'package:image_picker/image_picker.dart';

import '../firebase/auth.dart';
import '../model/crop_model.dart/crop_model.dart';
import '../model/user_model/user_model.dart';
import '../shared/constant.dart';
import '../sharedpreference/sharedpreference.dart';

part 'profile_state.freezed.dart';

final profileStateProvider =
    StateNotifierProvider.autoDispose<ProfileStateNotifier, ProfileState>(
  (ref) => ProfileStateNotifier(),
);

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isLoading,
    @Default(null) File? imageFile,
    @Default('') String userName,
    @Default(null) UserModel? userModel,
    @Default('') String originalImgURL,
    @Default([]) List<CropModel> sellingCrops,
  }) = _ProfileState;
}

class ProfileStateNotifier extends StateNotifier<ProfileState> {
  ProfileStateNotifier() : super(const ProfileState()) {
    getUser();
    getPostedCropList(FirebaseAuth.instance.currentUser!.uid);
  }
  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
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
  }

  getOriginalProfileUrl() {
    String originalImgURL = state.userModel!.profilePic != ''
        ? state.userModel!.profilePic as String
        : Constant.anonymousProfilePic;
    state = state.copyWith(originalImgURL: originalImgURL, isLoading: false);
  }

  /// 端末の画像を選択する
  Future<void> openImagePicker() async {
    final picker = ImagePicker();
    //ライブラリを開いて選択
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 600,
      maxWidth: 600,
    );

    // 画像が選択されなかった場合はスキップ
    if (pickedFile == null) {
      return;
    }

    // 選択した画像ファイルを代入
    state = state.copyWith(imageFile: File(pickedFile.path));
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
