import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/firebase/firestore.dart';
import 'package:fyp/model/crop_model.dart/crop_model.dart';
import 'package:fyp/screen/home_screen.dart';
import 'package:fyp/screen/widgets/widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
part 'sell_state.freezed.dart';

final sellStateProvider = StateNotifierProvider<SellStateNotifier, SellState>(
  (ref) => SellStateNotifier(),
);

@freezed
class SellState with _$SellState {
  const factory SellState({
    @Default('potato') String selectedCategory,
    @Default('北海道') String selectedCity,
    @Default(false) bool isLoading,
    // File? imageFile,
    @Default(null) CropModel? cropModel,
    @Default(1) int numberOfPictures,
    List<File>? imagefiles,
  }) = _SellState;
}

class SellStateNotifier extends StateNotifier<SellState> {
  SellStateNotifier() : super(SellState());
  String imgURL =
      'https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80';
  final picker = ImagePicker();
  List<String> filePaths = [];
  List<String> urls = [];

  void changeCategory(String selectedCategory) {
    state = state.copyWith(selectedCategory: selectedCategory);
  }

  void changeCity(String selectedCity) {
    state = state.copyWith(selectedCity: selectedCity);
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

  Future<void> onSellButton(
    String nameOfCrop,
    String description,
    String price,
    BuildContext context,
  ) async {
    state = state.copyWith(isLoading: true);
    try {
      urls = [];
      for (int i = 0; i < state.imagefiles!.length; i++) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('crops')
            .child('$nameOfCrop$i.jpg');
        await ref.putFile(state.imagefiles![i]);
        String downloadUrl = await ref.getDownloadURL();
        urls.add(downloadUrl);
      }
      await FireStore().savingCropData(
        urls,
        state.selectedCategory,
        nameOfCrop,
        description,
        state.selectedCity,
        price,
        FirebaseAuth.instance.currentUser!.uid,
      );
    } on Exception catch (e) {
      print(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
      nextScreenReplacement(context, HomeScreen());
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('出品しました')));
      state = state.copyWith(imagefiles: null);
    }
  }
}
