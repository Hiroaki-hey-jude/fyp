import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp/model/crop_model.dart/crop_model.dart';

import '../model/user_model/user_model.dart';

class FireStore {
  final String? uid;
  FireStore({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference cropCollection =
      FirebaseFirestore.instance.collection('crops');

  Future savingUserData(String name, String email) async {
    var user = UserModel(
      uid: uid!,
      name: name,
      email: email,
      profilePic: '',
      address: '',
    );
    //await userCollection.doc(uid).set(user.toFirestore());
    return await userCollection.doc(uid).set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'profilePic': user.profilePic,
      'address': user.address,
    });
  }

  Future savingCropData(
    List<String> picsOfCrops,
    String category,
    String title,
    String desciption,
    String senderAddress,
    String price,
  ) async {
    var crop = CropModel(
      picsOfCrops: picsOfCrops,
      category: category,
      name: title,
      description: desciption,
      address: senderAddress,
      price: price,
    );
    print('終りました');
    return await cropCollection.doc().set({
      'picsOfCrops': crop.picsOfCrops,
      'category': crop.category,
      'name': crop.name,
      'description': crop.description,
      'address': crop.address,
      'price': crop.price,
    });
  }

  Future gettingUserData(String email) async {
    QuerySnapshot querySnapshot =
        await userCollection.where('email', isEqualTo: email).get();
    return querySnapshot;
  }

  // 現在ログインしているユーザのFirestore情報取得
  Future<UserModel> getCurrentUserModel() async {
    print('kokokitemasuka');
    final model =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final userModel = UserModel.fromSnapshot(model);
    return userModel;
  }

  getCurrentPomo(String uid) async {
    final currentPomo = await userCollection.doc(uid).get();
    return currentPomo;
  }

  Future<void> startTimer(int goalPomo, String objectve, String uid) async {
    await userCollection.doc(uid).update({
      'goalPomo': goalPomo,
      'isOnline': true,
      'objective': objectve,
      'currentNumOfPomo': 0,
    });
  }

  toggleOnline(bool present) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'isOnline': present,
    });
  }

  report(String uid) async {
    await FirebaseFirestore.instance.collection('report').doc(uid).set({
      'uid': uid,
    });
  }

  block(String uid) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'blocks': FieldValue.arrayUnion([uid]),
    });
  }

  unBlock(String uid) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'blocks': FieldValue.arrayRemove([uid]),
    });
  }

  Future<List<CropModel>> getCropDocument(String category) async {
    final firestore = FirebaseFirestore.instance;

    // cropsコレクションの中で、categoryが'potato'であるドキュメントのみを取得する
    final cropsCollection = firestore.collection('crops');
    final categoryDocument =
        await cropsCollection.where('category', isEqualTo: category).get();
    List<CropModel> selectedCategoryCropData = [];
    categoryDocument.docs.forEach((element) {
      selectedCategoryCropData.add(CropModel.fromSnapshot(element));
    });
    return selectedCategoryCropData;
  }

  Future<List<CropModel>> getInitCropDocument() async {
    final firestore = FirebaseFirestore.instance;

    final cropsCollection = firestore.collection('crops');
    final categoryDocument =
        await cropsCollection.where('category', isEqualTo: 'potato').get();
    List<CropModel> potatoCropData = [];
    categoryDocument.docs.forEach((element) {
      potatoCropData.add(CropModel.fromSnapshot(element));
    });
    return potatoCropData;
  }
}
