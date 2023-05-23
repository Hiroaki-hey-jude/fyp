import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../firebase/auth.dart';
import '../firebase/firestore.dart';
import '../model/user_model/user_model.dart';
import '../shared/constant.dart';
import '../sharedpreference/sharedpreference.dart';

part 'setting_state.freezed.dart';

final settingStateProvider =
    StateNotifierProvider.autoDispose<SettingStateNotifier, SettingState>(
  (ref) => SettingStateNotifier(),
);

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    @Default(false) bool isLoading,
    @Default(null) UserModel? userModel,
    @Default('') String originalImgURL,
    @Default(null) File? imageFile,
  }) = _SettingState;
}

class SettingStateNotifier extends StateNotifier<SettingState> {
  SettingStateNotifier() : super(const SettingState()) {
    getUser();
  }
  String? changedUserName;
  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
  }

  Future<void> getUser() async {
    state = state.copyWith(isLoading: true);
    final user = await FireStore(uid: FirebaseAuth.instance.currentUser!.uid)
        .getCurrentUserModel2();
    if (!mounted) {
      return;
    }
    state = state.copyWith(
      userModel: user,
    );
    getOriginalProfileUrl();
    state = state.copyWith(isLoading: false);
  }

  getOriginalProfileUrl() {
    String originalImgURL = state.userModel!.profilePic != ''
        ? state.userModel!.profilePic
        : Constant.anonymousProfilePic;
    print(originalImgURL);
    print('original UILです');
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

  Future updateProfilePic() async {
    state = state.copyWith(isLoading: true);
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (state.imageFile != null && changedUserName != null) {
      state = state.copyWith(userModel: UserModel(name: changedUserName!));
      print('kokokitemasuka');
      print(state.userModel!.name);
      final ref = FirebaseStorage.instance
          .ref()
          .child('profileimages')
          .child('${state.userModel!.name}.jpg');
      await ref.putFile(state.imageFile!);
      String imgURL = await ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'profilePic': imgURL,
        'name': state.userModel!.name,
      });
      state = state.copyWith(isLoading: false);
    } else if (state.imageFile != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child('profileimages')
          .child('${state.userModel!.name}.jpg');
      await ref.putFile(state.imageFile!);
      String imgURL = await ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'profilePic': imgURL,
      });
      state = state.copyWith(isLoading: false);
    } else if (changedUserName != null) {
      state = state.copyWith(userModel: UserModel(name: changedUserName!));
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'name': state.userModel!.name,
      });
      state = state.copyWith(isLoading: false);
    } else {
      state = state.copyWith(isLoading: false);
      return null;
    }
  }

  changeUserName(String name) {
    print('change user name');
    changedUserName = name;
  }
}
