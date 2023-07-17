import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/firebase/firestore.dart';
import 'package:fyp/model/cropcomment_model/cropcomment_model.dart';
import 'package:uuid/uuid.dart';
import '../model/user_model/user_model.dart';

part 'comment_state.freezed.dart';

final commentStateProvider =
    StateNotifierProvider.family<CommentStateNotifier, CommentState, String>(
  (ref, sellerId) => CommentStateNotifier(sellerId),
);

@freezed
class CommentState with _$CommentState {
  const factory CommentState({
    @Default(false) bool isLoading,
    @Default(null) UserModel? currentUser,
    @Default(<UserModel>[]) List<UserModel> userList,
    @Default(null) String? errorMessage,
    @Default(null) String? sellerId,
  }) = _CommentState;
}

class CommentStateNotifier extends StateNotifier<CommentState> {
  CommentStateNotifier(sellerId) : super(const CommentState()) {
    init(sellerId);
    // hi(sellerName);
  }

  Future<void> init(String uid) async {
    try {
      state = state.copyWith(isLoading: true);
      await fetchCurrentUserInfo();
      await fetchUserInfo();
    } catch (e) {
      if (mounted) {
        state = state.copyWith(errorMessage: '何らかのエラーが発生しました。');
      }
    } finally {
      if (mounted) {
        if (state.currentUser!.uid == uid) {
          print(state.currentUser!.uid);
          print('同じ');
        } else {
          print(state.currentUser!.uid);
          print(uid);
          print('同じじゃないよん');
        }
        state = state.copyWith(isLoading: false, sellerId: uid);
      }
    }
  }

  // チャットで使用するログインユーザー情報取得
  Future<void> fetchCurrentUserInfo() async {
    final userModel = await FireStore()
        .getCurrentUserModel(FirebaseAuth.instance.currentUser!.uid);
    if (!mounted) {
      return;
    }
    state = state.copyWith(currentUser: userModel);
  }

  void hi(String sellerId) {
    if (state.currentUser!.uid == sellerId) {
      print('同じ');
    } else {
      print('同じじゃないよん');
    }
  }

  // チャットで使用する全てのユーザー情報取得
  Future<void> fetchUserInfo() async {
    List<UserModel> list = [];
    final users = await FirebaseFirestore.instance.collection('users').get();
    for (var element in users.docs) {
      list.add(UserModel.fromSnapshot(element));
    }
    state = state.copyWith(userList: list);
  }

  // チャット一覧をストリームで取得
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchChatMessages(
      String cropId) async* {
    yield* FirebaseFirestore.instance
        .collection('crops')
        .doc(cropId)
        .collection('comment')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // チャット送信ボタンフィールドの挙動(firestoreにチャットメッセージ書き込み)
  Future<void> handleSendPressed(String message, String cropId) async {
    try {
      // 文字数が10001文字以上の場合はerrorMessageのstateを更新してもモーダル表示
      if (message.length > 10000) {
        state = state.copyWith(errorMessage: '10000字以内で入力してください');
        return;
      }
      state = state.copyWith(isLoading: true);

      // fireStoreに保存するデータ
      final chatMessage = CropcommentModel(
        id: const Uuid().v4(),
        userId: state.currentUser!.uid,
        userName: state.currentUser!.name,
        messageText: message,
        sendTime: DateTime.now(),
        createdAt: DateTime.now(),
        // deviceTokens: deviceTokens,
      );
      if (state.currentUser!.uid == state.sellerId) {
        print('同じ');
        await FirebaseFirestore.instance
            .collection('crops')
            .doc(cropId)
            .collection('comment')
            .doc()
            .set(chatMessage.toJson());
      } else {
        print('同じじゃないよん');
        await FirebaseFirestore.instance
            .collection('crops')
            .doc(cropId)
            .update({'hasUnread': true});
        await FirebaseFirestore.instance
            .collection('crops')
            .doc(cropId)
            .collection('comment')
            .doc()
            .set(chatMessage.toJson());
      }
    } on Exception catch (e) {
      print(e.toString());
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  // 開いたら既読つける
  Future<void> setReadUser(String cropId) async {
    await FireStore().setFalseForReadMessage(cropId);
  }
}
