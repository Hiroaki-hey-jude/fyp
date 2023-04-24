import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/firebase/firestore.dart';
import 'package:fyp/model/crop_model.dart/crop_model.dart';

import '../firebase/auth.dart';
import '../model/user_model/user_model.dart';
import '../sharedpreference/sharedpreference.dart';

part 'crop_state.freezed.dart';

final cropStateProvider = StateNotifierProvider<CropStateNotifier, CropState>(
  (ref) => CropStateNotifier(),
);

final selectedCategoryProvider = StateProvider((ref) => 'potato');

final cropStreamProvider =
    StreamProvider.autoDispose<QuerySnapshot<Map<String, dynamic>>>((ref) {
  final firestore = FirebaseFirestore.instance;

  // cropsコレクションの中で、categoryが'potato'であるドキュメントのみを取得する
  final cropsCollection = firestore.collection('crops');
  return cropsCollection.snapshots();
});

final potatoCropsStreamProvider =
    StreamProvider.autoDispose<QuerySnapshot<Map<String, dynamic>>>((ref) {
  final firestore = FirebaseFirestore.instance;

  // cropsコレクションの中で、categoryが'potato'であるドキュメントのみを取得する
  final cropsCollection = firestore.collection('crops');
  final potatoCrops = cropsCollection.where('category', isEqualTo: 'potato');
  return potatoCrops.snapshots();
});

final riceCropsStreamProvider =
    StreamProvider.autoDispose<QuerySnapshot<Map<String, dynamic>>>((ref) {
  // Firestoreのインスタンスを取得する
  final firestore = FirebaseFirestore.instance;

  // cropsコレクションの中で、categoryが'rice'であるドキュメントのみを取得する
  final cropsCollection = firestore.collection('crops');
  final riceCrops = cropsCollection.where('category', isEqualTo: 'rice');
  return riceCrops.snapshots();
});

final tomatoCropsStreamProvider =
    StreamProvider.autoDispose<QuerySnapshot<Map<String, dynamic>>>((ref) {
  // Firestoreのインスタンスを取得する
  final firestore = FirebaseFirestore.instance;

  // cropsコレクションの中で、categoryが'tomato'であるドキュメントのみを取得する
  final cropsCollection = firestore.collection('crops');
  final tomatoCrops = cropsCollection.where('category', isEqualTo: 'tomato');
  return tomatoCrops.snapshots();
});

final imperfectCropsStreamProvider =
    StreamProvider.autoDispose<QuerySnapshot<Map<String, dynamic>>>((ref) {
  // Firestoreのインスタンスを取得する
  final firestore = FirebaseFirestore.instance;

  // cropsコレクションの中で、categoryが'rice'であるドキュメントのみを取得する
  final cropsCollection = firestore.collection('crops');
  final imperfectCrops =
      cropsCollection.where('category', isEqualTo: 'imperfect');
  return imperfectCrops.snapshots();
});

@freezed
class CropState with _$CropState {
  const factory CropState({
    @Default(false) bool isLoading,
    @Default(0) int selectedIndex,
    @Default(0) int selectedIndexForOutlineButton,
    @Default('potato') String selectedCategory,
    @Default([]) List<CropModel> selectedCategoryCrops,
  }) = _CropState;
}

class CropStateNotifier extends StateNotifier<CropState> {
  CropStateNotifier() : super(const CropState()) {
    getInitCropData();
  }

  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
  }

  void onItemTapped(int index) {
    state = state.copyWith(
      selectedIndex: index,
    );
  }

  void onCategoryButtonTap(String title) {
    if (title == 'potato') {
      state = state.copyWith(
        selectedIndexForOutlineButton: 0,
      );
    } else if (title == 'rice') {
      state = state.copyWith(
        selectedIndexForOutlineButton: 1,
      );
    } else if (title == 'tomato') {
      state = state.copyWith(
        selectedIndexForOutlineButton: 2,
      );
    } else {
      state = state.copyWith(
        selectedIndexForOutlineButton: 3,
      );
    }
    getSelectedCategory(title);
  }

  Future<void> getSelectedCategory(String category) async {
    final selectedCropData = await FireStore().getCropDocument(category);
    state = state.copyWith(selectedCategoryCrops: selectedCropData);
  }

  Future<void> getInitCropData() async {
    final potatoCropData = await FireStore().getInitCropDocument();
    state = state.copyWith(selectedCategoryCrops: potatoCropData);
  }
}
