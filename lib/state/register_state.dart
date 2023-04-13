import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../firebase/auth.dart';
import '../model/user_model/user_model.dart';
import '../shared/enum.dart';
import '../sharedpreference/sharedpreference.dart';

part 'register_state.freezed.dart';

final registerStateProvider =
    StateNotifierProvider<RegisterStateNotifier, RegisterState>(
  (ref) => RegisterStateNotifier(),
);

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(false) bool isLoading,
    @Default('') String password,
    @Default(null) UserModel? userModel,
    // @Default(true) bool passwordInVisible,
    @Default(false) bool navigateCropScreen,
  }) = _RegisterState;
}

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  RegisterStateNotifier() : super(const RegisterState());

  // void toggleVisible() {
  //   state = state.copyWith(passwordInVisible: !state.passwordInVisible);
  // }

  Future<void> register(
    BuildContext context,
    GlobalKey<FormState>? formKey,
    String name,
    String email,
    String password,
  ) async {
    if (formKey!.currentState!.validate()) {
      state = state.copyWith(isLoading: true);
      state = state.copyWith(userModel: UserModel(name: name, email: email));
      final EmailSignResults emailSignResults =
          await Auth().registerUserWithEmailandPassword(
        name,
        email,
        password,
      );
      String message = '';
      if (emailSignResults == EmailSignResults.SignUpCompleted) {
        await SharedPreferencesData().saveUserLoggedInStatus(true);
        await SharedPreferencesData().saveUserEmailSF(email);
        await SharedPreferencesData().saveUserNameSF(name);
        state = state.copyWith(navigateCropScreen: true);
      } else if (emailSignResults == EmailSignResults.SignUpNotCompleted) {
        message = 'ユーザー登録に失敗しました。もう一回試してください';
      } else {
        message = 'このメールアドレスはすでに存在します';
      }
      if (message != '') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      }
      state = state.copyWith(isLoading: false);
    }
  }

  void resetParameta() {
    state = state.copyWith(navigateCropScreen: false);
  }
}
