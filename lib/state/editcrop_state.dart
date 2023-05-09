import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../firebase/auth.dart';
import '../firebase/firestore.dart';
import '../model/crop_model.dart/crop_model.dart';
import '../model/user_model/user_model.dart';
import '../screen/home_screen.dart';
import '../screen/widgets/widget.dart';
import '../sharedpreference/sharedpreference.dart';

part 'editcrop_state.freezed.dart';

final editcropStateProvider = StateNotifierProvider.autoDispose
    .family<EditcropStateNotifier, EditcropState, String>(
  (ref, cropId) => EditcropStateNotifier(cropId),
);

@freezed
class EditcropState with _$EditcropState {
  const factory EditcropState({
    @Default(false) bool isLoading,
    @Default('') String cropId,
    @Default(null) CropModel? cropModel,
    @Default('potato') String selectedCategory,
    @Default('北海道') String selectedCity,
    @Default(1) int numberOfPictures,
    @Default([]) List<File> imagefiles,
    @Default('') String originalTitle,
    @Default('') String orginalDescription,
    @Default('') String originalPrice,
  }) = _EditcropState;
}

class EditcropStateNotifier extends StateNotifier<EditcropState> {
  EditcropStateNotifier(cropId) : super(EditcropState()) {
    getPotentialPurchaseCropData(cropId);
    print(state.imagefiles);
  }

  String imgURL =
      'https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80';
  final picker = ImagePicker();
  List<String> filePaths = [];
  List<String> urls = [];

  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
  }

  Future<void> getPotentialPurchaseCropData(String cropId) async {
    state = state.copyWith(isLoading: true);
    final cropModel = await FireStore().getPotentialCropData(cropId);
    state = state.copyWith(
      cropModel: cropModel,
      selectedCategory: cropModel.category,
      selectedCity: cropModel.address,
      originalTitle: cropModel.name,
      orginalDescription: cropModel.description,
      originalPrice: cropModel.description,
      isLoading: false,
    );
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

  void changeCity(String selectedCity) {
    state = state.copyWith(selectedCity: selectedCity);
  }

  void changeCategory(String selectedCategory) {
    state = state.copyWith(selectedCategory: selectedCategory);
  }

  void titleChangeController(String title) {
    state = state.copyWith(originalTitle: title);
  }

  Future<void> onEditButton(
    String nameOfCrop,
    String description,
    String price,
    BuildContext context,
  ) async {
    state = state.copyWith(isLoading: true);
    try {
      if (state.imagefiles.isNotEmpty) {
        for (int i = 0; i < state.imagefiles.length; i++) {
          final ref = FirebaseStorage.instance
              .ref()
              .child('crops')
              .child('$nameOfCrop$i.jpg');
          await ref.putFile(state.imagefiles[i]);
          String downloadUrl = await ref.getDownloadURL();
          urls.add(downloadUrl);
        }
        await FireStore().editCropData(
          urls,
          state.selectedCategory,
          nameOfCrop,
          description,
          state.selectedCity,
          price,
          state.cropModel!.cropId,
        );
      } else {
        await FireStore().editCropDataWithoutPics(
          state.selectedCategory,
          nameOfCrop,
          description,
          state.selectedCity,
          price,
          state.cropModel!.cropId,
        );
      }
    } on Exception catch (e) {
      print(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
      nextScreenReplacement(context, HomeScreen());
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('編集しました')));
      state = state.copyWith(imagefiles: []);
    }
  }

  Future<void> onDeliteCropPost(String cropId, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    FireStore().deleteCropPost(cropId);
    nextScreenReplacement(context, HomeScreen());
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('削除しました')));
    state = state.copyWith(isLoading: false);
  }
}
