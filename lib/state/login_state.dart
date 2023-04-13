import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/firebase/firestore.dart';
import 'package:fyp/shared/enum.dart';

import '../firebase/auth.dart';
import '../model/user_model/user_model.dart';
import '../sharedpreference/sharedpreference.dart';

part 'login_state.freezed.dart';

final loginStateProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>(
  (ref) => LoginStateNotifier(),
);

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default('') String password,
    @Default(null) UserModel? userModel,
    @Default(null) SharedPreferencesData? sharedPreferencesData,
    @Default(null) Auth? auth,
    @Default(false) bool navigateCropScreen,
  }) = _LoginState;
}

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(const LoginState());
  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
  }

  Future<void> login(
    BuildContext context,
    GlobalKey<FormState>? formKey,
    String email,
    String password,
  ) async {
    if (formKey!.currentState!.validate()) {
      state = state.copyWith(isLoading: true);
      // Authログイン
      final EmailLogInResults emailLogInResults =
          await Auth().logInUserWithEmailandPassword(
        email,
        password,
      );
      String message = '';
      if (emailLogInResults == EmailLogInResults.LogInCompleted) {
        // ユーザ情報取得
        QuerySnapshot snapshot =
            await FireStore().gettingUserData(email);
        // 端末にも保存
        await SharedPreferencesData().saveUserLoggedInStatus(true);
        await SharedPreferencesData().saveUserEmailSF(email);
        await SharedPreferencesData().saveUserNameSF(snapshot.docs[0]['name']);

        // trueにすることでLoginPageのref.listenで自動で画面遷移してくれます
        state = state.copyWith(navigateCropScreen: true);
      } else if (emailLogInResults == EmailLogInResults.EmailNotVerified) {
        message = 'メールアドレスが確認されませんでした \nユーザー登録をしてください';
      } else if (emailLogInResults == EmailLogInResults.EmailPasswordInvalid) {
        message = 'メールアドレスかパスワードが違います';
      } else {
        message = 'ログインに失敗しました';
      }

      if (message != '')
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      state = state.copyWith(isLoading: false);
    } else {
      print('not Validated');
    }
  }

  void resetParameta() {
    state = state.copyWith(navigateCropScreen: false);
  }
}







  // void toggleVisible() {
  //   state = state.copyWith(passwordInVisible: !state.passwordInVisible);
  // }

  // Future<void> login(
  //   BuildContext context,
  //   GlobalKey<FormState>? formKey,
  //   String email,
  //   String password,
  // ) async {
  //   if (formKey!.currentState!.validate()) {
  //     state = state.copyWith(isLoading: true);
  //     // Authログイン
  //     final EmailLogInResults emailLogInResults =
  //         await Auth().logInUserWithEmailandPassword(
  //       email,
  //       password,
  //     );
  //     String message = '';
  //     if (emailLogInResults == EmailLogInResults.LogInCompleted) {
  //       // ユーザ情報取得
  //       QuerySnapshot snapshot =
  //           await FirestoreService().gettingUserData(email);
  //       // 端末にも保存
  //       await SharedPreferencesData().saveUserLoggedInStatus(true);
  //       await SharedPreferencesData().saveUserEmailSF(email);
  //       await SharedPreferencesData().saveUserNameSF(snapshot.docs[0]['name']);

  //       // trueにすることでLoginPageのref.listenで自動で画面遷移してくれます
  //       state = state.copyWith(navigateChatRoomPage: true);
  //     } else if (emailLogInResults == EmailLogInResults.EmailNotVerified) {
  //       message = 'メールアドレスが確認されませんでした \nユーザー登録をしてください';
  //     } else if (emailLogInResults == EmailLogInResults.EmailPasswordInvalid) {
  //       message = 'メールアドレスかパスワードが違います';
  //     } else {
  //       message = 'ログインに失敗しました';
  //     }

  //     if (message != '')
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text(message)));
  //     state = state.copyWith(isLoading: false);
  //   } else {
  //     print('not Validated');
  //   }
  // }

  // void resetParameta() {
  //   state = state.copyWith(navigateChatRoomPage: false);
  // }

