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
      coins: '',
    );
    //await userCollection.doc(uid).set(user.toFirestore());
    return await userCollection.doc(uid).set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'profilePic': user.profilePic,
      'address': user.address,
      'coins': user.coins,
    });
  }

  Future savingCropData(
      List<String> picsOfCrops,
      String category,
      String title,
      String desciption,
      String senderAddress,
      String price,
      String sellerId) async {
    var crop = CropModel(
      picsOfCrops: picsOfCrops,
      category: category,
      name: title,
      description: desciption,
      address: senderAddress,
      price: price,
      sellerId: sellerId,
    );
    print('終りました');
    DocumentReference roomDocumentReference = await cropCollection.add({
      'picsOfCrops': crop.picsOfCrops,
      'category': crop.category,
      'name': crop.name,
      'description': crop.description,
      'address': crop.address,
      'price': crop.price,
      'cropId': '',
      'sellerId': crop.sellerId,
    });

    return roomDocumentReference.update({
      'cropId': roomDocumentReference.id,
    });
  }

  Future editCropData(
    List<String> picsOfCrops,
    String category,
    String title,
    String desciption,
    String senderAddress,
    String price,
    String cropId,
  ) async {
    cropCollection.doc(cropId).update({
      'picsOfCrops': picsOfCrops,
      'price': price,
      'name': title,
      'category': category,
      'description': desciption,
      'address': senderAddress,
    });
  }

  Future editCropDataWithoutPics(
    String category,
    String title,
    String desciption,
    String senderAddress,
    String price,
    String cropId,
  ) async {
    cropCollection.doc(cropId).update({
      'price': price,
      'name': title,
      'category': category,
      'description': desciption,
      'address': senderAddress,
    });
  }

  void deleteCropPost(String cropId) {
    cropCollection.doc(cropId).delete();
  }

  Future gettingUserData(String email) async {
    QuerySnapshot querySnapshot =
        await userCollection.where('email', isEqualTo: email).get();
    return querySnapshot;
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

  Future<CropModel> getPotentialCropData(String cropId) async {
    // print('hello');
    // print(cropId);
    final model =
        await FirebaseFirestore.instance.collection('crops').doc(cropId).get();
    final cropModel = CropModel.fromSnapshot(model);
    print('jelp1');
    return cropModel;
  }

  // 現在ログインしているユーザのFirestore情報取得
  Future<UserModel> getCurrentUserModel(String uid) async {
    final model =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final userModel = UserModel.fromSnapshot(model);
    return userModel;
  }

  Future<List<CropModel>> getPostedCropList(String sellerId) async {
    final firestore = FirebaseFirestore.instance;

    final cropsCollection = firestore.collection('crops');
    final categoryDocument =
        await cropsCollection.where('sellerId', isEqualTo: sellerId).get();
    List<CropModel> postedCropData = [];
    categoryDocument.docs.forEach((element) {
      postedCropData.add(CropModel.fromSnapshot(element));
    });
    return postedCropData;
  }

  Future<UserModel> getUserModelForBuy(String sellerid) async {
    final model = await FirebaseFirestore.instance
        .collection('users')
        .doc(sellerid)
        .get();
    final userModel = UserModel.fromSnapshot(model);
    return userModel;
  }

  Future<void> setFalseForReadMessage(String cropId) async {
    await FirebaseFirestore.instance
        .collection('crops')
        .doc(cropId)
        .update({'hasUnread': false});
  }

  Future<void> incrementCoin(String coin, String uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'coins': coin});
  }
}
