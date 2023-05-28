import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp/model/address_model/address_model.dart';
import 'package:fyp/model/crop_model.dart/crop_model.dart';
import 'package:fyp/model/pass_model/pass_model.dart';
import 'package:fyp/model/post_model/post_model.dart';

import '../model/user_model/user_model.dart';

class FireStore {
  final String? uid;
  FireStore({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference cropCollection =
      FirebaseFirestore.instance.collection('crops');
  final CollectionReference postCollection =
      FirebaseFirestore.instance.collection('posts');
  final CollectionReference passCollection =
      FirebaseFirestore.instance.collection('passes');

  Future<void> savingUserData(String name, String email) async {
    print(uid);
    var address = AddressModel(
      city: '',
      prefecture: '',
      zipCode: '',
      number: '',
    );
    var user = UserModel(
      uid: uid!,
      name: name,
      email: email,
      profilePic: '',
      address: address,
      coins: '',
    );

    var userData = {
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'profilePic': user.profilePic,
      'address': user.address!.toJson(), // AddressModelをマップに変換
      'coins': user.coins,
    };

    var jsonData = jsonEncode(userData); // マップをJSON文字列に変換

    await userCollection
        .doc(uid)
        .set(jsonDecode(jsonData)); // JSON文字列をFirestoreに保存
    print(user.address);
    print('address');
  }

  Future savingPostData(PostModel post) async {
    DocumentReference postDocumentReference = await postCollection.add({
      'posterId': post.posterId,
      'picsOfCrops': post.picsOfCrops,
      'sentenceOfPost': post.sentenceOfPost,
      'postId': '',
      'createdAt': post.createdAt,
    });
    return postDocumentReference.update({
      'postId': postDocumentReference.id,
    });
  }

  Future savingCropData(
    List<String> picsOfCrops,
    String category,
    String title,
    String desciption,
    String senderAddress,
    String price,
    String sellerId,
  ) async {
    var crop = CropModel(
      picsOfCrops: picsOfCrops,
      category: category,
      name: title,
      description: desciption,
      address: senderAddress,
      price: price,
      sellerId: sellerId,
      hasUnread: false,
      isbought: false,
    );
    print('終りました');
    DocumentReference roomDocumentReference =
        await cropCollection.add({crop.toJson()});

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
    final categoryDocument = await cropsCollection
        .where('category', isEqualTo: category)
        .where('isbought', isEqualTo: false)
        .get();
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
    print(uid);
    final model =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    print('dddddd');
    print(model.data());
    final userModel = UserModel.fromSnapshot(model);
    return userModel;
  }

  Future<UserModel> getCurrentUserModel2() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get();

    UserModel userModel;
    if (querySnapshot.docs.isNotEmpty) {
      final documentSnapshot = querySnapshot.docs.first;
      userModel = UserModel.fromSnapshot(documentSnapshot);
      // userModelの後続の処理を行う
    } else {
      // エラーハンドリングなどの処理
      throw Exception("ユーザーデータが見つかりませんでした");
    }
    print('dddddd');
    print(userModel);
    return userModel;
  }

  Future<List<CropModel>> getPostedCropList(String sellerId) async {
    final firestore = FirebaseFirestore.instance;

    final cropsCollection = firestore.collection('crops');
    final categoryDocument = await cropsCollection
        .where('sellerId', isEqualTo: sellerId)
        .where('isbought', isEqualTo: false)
        .get();
    List<CropModel> postedCropData = [];
    categoryDocument.docs.forEach((element) {
      postedCropData.add(CropModel.fromSnapshot(element));
    });
    return postedCropData;
  }

  Future<UserModel> getUserModelForBuy(String sellerid) async {
    print('model 1  $sellerid');
    final model = await FirebaseFirestore.instance
        .collection('users')
        .doc(sellerid)
        .get();
    print('model  2  $model');
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

  Future<void> storeAddressData(
    String zipCode,
    String prefecture,
    String city,
    String number,
    String uid,
  ) async {
    try {
      var userDoc = userCollection.doc(uid); // ユーザーのドキュメントへの参照を取得
      var userDocSnapshot = await userDoc.get(); // ユーザーのドキュメントのデータを取得

      if (userDocSnapshot.exists) {
        var userData = userDocSnapshot.data() as Map<String, dynamic>;

        var address = {
          'zipCode': zipCode,
          'prefecture': prefecture,
          'city': city,
          'number': number,
        };

        userData['address'] = address; // アドレス情報を更新

        await userDoc.set(userData); // 更新されたユーザーデータを保存
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> purchaseCrop(
    String currentCoin,
    String priceOfCrop,
    String uid,
    String cropId,
  ) async {
    int currentAmountOfCoin = int.parse(currentCoin);
    int priceCrop = int.parse(priceOfCrop);
    int newAmountOfCoin = currentAmountOfCoin - priceCrop;
    userCollection.doc(uid).update({
      'coins': newAmountOfCoin.toString(),
    });
    cropCollection.doc(cropId).update({
      'isbought': true,
    });
  }

  Future<List<PostModel>> getAgriculturalPostedList(String posterId) async {
    final firestore = FirebaseFirestore.instance;

    final postsCollection = firestore.collection('posts');
    final document =
        await postsCollection.where('posterId', isEqualTo: posterId).get();
    List<PostModel> postedCropData = [];
    document.docs.forEach((element) {
      postedCropData.add(PostModel.fromSnapshot(element));
    });
    return postedCropData;
  }

  Future<List<PostModel>> getAllAgriculturalPostedList() async {
    final firestore = FirebaseFirestore.instance;

    final postsCollection = firestore.collection('posts');
    final document =
        await postsCollection.orderBy('createdAt', descending: true).get();
    List<PostModel> postedCropData = [];
    document.docs.forEach((element) {
      postedCropData.add(PostModel.fromSnapshot(element));
    });
    return postedCropData;
  }

  Future<void> buyPass(String consumerUid, String farmerUid) async {
    print('$consumerUid consumer Uid');
    print('$farmerUid farmer uid');

    var pass = PassModel(
      consumerUid: consumerUid,
      farmerUid: farmerUid,
      expirationDate: DateTime.now().add(const Duration(days: 30)),
    );
    await passCollection.doc(consumerUid).set(pass.toJson());
  }
}
