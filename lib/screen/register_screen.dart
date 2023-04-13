import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/screen/home_screen.dart';
import 'package:fyp/screen/login_screen.dart';

import '../shared/constant.dart';
import '../state/register_state.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final notifier = ref.watch(registerStateProvider.notifier);

    ref.listen<RegisterState>(
      registerStateProvider,
      (previous, state) {
        if (state.navigateCropScreen) {
          notifier.resetParameta();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) =>  HomeScreen()));
        }
      },
    );
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final notifier = ref.watch(registerStateProvider.notifier);
          final state = ref.watch(registerStateProvider);
          return state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : GestureDetector(
                  onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(
                              30, deviceHeight / 5.8, 30, 0),
                          child: Column(
                            children: [
                              const Text(
                                'Direct',
                                style: TextStyle(
                                  color: Constant.blackColor,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      controller: nameEditingController,
                                      decoration: const InputDecoration(
                                        labelText: "名前",
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Constant.blackColor,
                                        ),
                                      ),
                                      // check tha validation
                                      validator: (val) {
                                        if (val!.isNotEmpty) {
                                          return null;
                                        } else {
                                          return '名前を入力してください';
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 15),
                                    TextFormField(
                                      controller: emailEditingController,
                                      decoration: const InputDecoration(
                                        labelText: "メールアドレス",
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Constant.blackColor,
                                        ),
                                      ),
                                      // check tha validation
                                      validator: (val) {
                                        return RegExp(
                                                    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(val!)
                                            ? null
                                            : "有効なメールアドレスを入力してください";
                                      },
                                    ),
                                    const SizedBox(height: 15),
                                    TextFormField(
                                      controller: passwordEditingController,
                                      // obscureText: state.passwordInVisible,
                                      decoration: const InputDecoration(
                                        labelText: "パスワード",
                                        prefixIcon: Icon(Icons.lock,
                                            color: Constant.blackColor),
                                      ),
                                      validator: (val) {
                                        if (val!.length < 6) {
                                          return "パスワードは６文字以上です";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Constant().primaryColor,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: const Text(
                                            "アカウント作成",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                          onPressed: () {
                                            notifier.register(
                                              context,
                                              formKey,
                                              nameEditingController.text,
                                              emailEditingController.text,
                                              passwordEditingController.text,
                                            );
                                          }),
                                    ),
                                    const SizedBox(height: 15),
                                    Column(
                                      children: [
                                        const Text(
                                          'アカウントを既にお持ちですか？',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(height: 5),
                                        Text.rich(
                                          TextSpan(
                                            text: 'こちらからログイン',
                                            style: const TextStyle(
                                              color: Colors.blue,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginScreen()));
                                              },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 35),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
