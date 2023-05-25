import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/firebase/firestore.dart';
import 'package:fyp/model/crop_model.dart/crop_model.dart';
import 'package:fyp/model/post_model/post_model.dart';
import 'package:fyp/model/user_model/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../screen/home_screen.dart';
import '../screen/widgets/widget.dart';
part 'post_state.freezed.dart';

final postStateProvider = StateNotifierProvider<PostStateNotifier, PostState>(
  (ref) => PostStateNotifier(),
);

@freezed
class PostState with _$PostState {
  const factory PostState({
    @Default(false) bool isLoading,
    // File? imageFile,
    @Default(null) UserModel? userModel,
    @Default(null) PostModel? postModel,
    @Default(1) int numberOfPictures,
    List<File>? imagefiles,
  }) = _PostState;
}

class PostStateNotifier extends StateNotifier<PostState> {
  PostStateNotifier() : super(const PostState()) {
    getCurrentUserModel(FirebaseAuth.instance.currentUser!.uid);
  }
  String imgURL =
      'https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80';
  final picker = ImagePicker();
  List<String> filePaths = [];
  List<String> urls = [];

  // void changeCategory(String selectedCategory) {
  //   state = state.copyWith(selectedCategory: selectedCategory);
  // }

  // void changeCity(String selectedCity) {
  //   state = state.copyWith(selectedCity: selectedCity);
  // }

  Future<void> getCurrentUserModel(String uid) async {
    final userModel = await FireStore().getCurrentUserModel(uid);
    state = state.copyWith(userModel: userModel);
    print(state.userModel!.name);
  }

  Future<void> pickImage() async {
    print('picked fileに入った');
    List<File> imagefiles = [];

    List<XFile> xfilePick = await picker.pickMultiImage();

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        state = state.copyWith(numberOfPictures: i + 1);
        print('${state.numberOfPictures} num of picture');
        print(i);
        imagefiles.add(File(xfilePick[i].path));
      }
    } else {
      return;
    }

    //選択した画像ファイルを代入
    filePaths = imagefiles.map((file) => file.path).toList();
    // urls = filePaths.map((filePath) => Uri.file(filePath).toString()).toList();
    state = state.copyWith(imagefiles: imagefiles);
  }

  Future<void> onPostButton(
    String posterId,
    String sentenceOfPost,
    DateTime dateTime,
    BuildContext context,
  ) async {
    state = state.copyWith(isLoading: true);
    try {
      print(dateTime.hashCode);
      print(state.userModel!.name);
      // print(object)
      for (int i = 0; i < state.imagefiles!.length; i++) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('posts')
            .child('$dateTime$i.jpg');
        await ref.putFile(state.imagefiles![i]);
        String downloadUrl = await ref.getDownloadURL();
        urls.add(downloadUrl);
      }
      var post = PostModel(
        posterId: state.userModel!.uid,
        picsOfCrops: urls,
        sentenceOfPost: sentenceOfPost,
        createdAt: dateTime,
        postId: '',
      );
      await FireStore().savingPostData(post);
    } on Exception catch (e) {
      print(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
      nextScreenReplacement(context, HomeScreen());
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('投稿しました')));
      state = state.copyWith(imagefiles: null);
    }
  }
}
