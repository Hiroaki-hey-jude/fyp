import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/model/cropcomment_model/cropcomment_model.dart';
import 'package:fyp/state/comment_state.dart';
import 'package:intl/intl.dart';

import '../shared/constant.dart';

class CommentScreen extends ConsumerWidget {
  const CommentScreen(
      {required this.cropId, required this.sellerName, super.key});
  final String cropId;
  final String sellerName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commentStateProvider(sellerName));
    final notifier = ref.watch(commentStateProvider(sellerName).notifier);

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: notifier.fetchChatMessages(cropId),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: ColoredBox(
                color: Colors.white,
                child: Text('エラーが発生しました'),
              ),
            );
          }
          if (state.currentUser == null) {
            return const Center(
              child: Text('ログインしてください'),
            );
          }

          // 画面に表示するための空配列を作成
          final messages = <types.Message>[];
          
          notifier.setReadUser(cropId);

          if (snapshot.hasData) {
            // firestoreからチャッメッセージリスト型で取得
            final list = snapshot.data!.docs;
            // flutter_chat_uiで使用するtypes.Userを定義
            types.User typeUser;

            final userList = ref.watch(commentStateProvider(sellerName)
                .select((state) => state.userList));
            // print(state.currentUser!.blocks.toString());

            for (final snapShot in list) {
              final messageModel = CropcommentModel.fromSnapshot(snapShot);

              // グループユーザーから1件づつ取得
              for (final user in userList) {
                // グループ内のユーザーIDとチャット投稿者IDが一致していれば、types.Userに一致したユーザー名を渡す。
                // ※ユーザー名を変更時、変更したユーザー名を表示したい為、streamのsnapShotではなくuser情報からデータを取得
                if (user.uid == messageModel.userId) {
                  String profile = '';
                  String name = user.name;

                  if (user.profilePic == null || user.profilePic == '') {
                    profile = Constant.anonymousProfilePic;
                  } else {
                    profile = user.profilePic!;
                  }

                  typeUser = types.User(
                    id: user.uid,
                    firstName: name,
                    imageUrl: profile,
                  );

                  // flutter_chat_uiで使用するtypes.TextMessageにデーター代入
                  if (messageModel.messageText != null) {
                    final message = types.TextMessage(
                      id: messageModel.id!,
                      author: typeUser,
                      text: messageModel.messageText!,
                      createdAt: messageModel.createdAt!.millisecondsSinceEpoch,
                    );
                    // messageをtypes.Message型の配列に代入
                    messages.add(message);
                  }
                }
              }
            }
            return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'comment',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Chat(
                      user: types.User(
                        id: state.currentUser!.uid,
                        firstName: state.currentUser!.name,
                      ),
                      messages: messages,
                      onSendPressed: (message) {
                        notifier.handleSendPressed(message.text, cropId);
                      },
                      onMessageLongPress: (context, message) {},
                      showUserAvatars: true,
                      showUserNames: true,
                      onAvatarTap: (avatar) {
                        // _showBlockAndReportDialog(
                        //   context: context,
                        //   user: avatar,
                        //   ref: ref,
                        // );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: ColoredBox(
                color: Colors.white,
                child: Text(''),
              ),
            );
          }
        });
  }
}
