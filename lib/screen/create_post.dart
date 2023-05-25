import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/model/category_model/category_model.dart';
import 'package:fyp/model/post_model/post_model.dart';
import 'package:fyp/screen/widgets/widget.dart';
import 'package:fyp/state/post_state.dart';
import 'package:fyp/state/sell_state.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(sellStateProvider);
    // final notifier = ref.watch(sellStateProvider.notifier);

    final TextEditingController sentenceEditingController =
        TextEditingController();
    final formKey = GlobalKey<FormState>(); // it is used to validate input

    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final state = ref.watch(postStateProvider);
        final notifier = ref.watch(postStateProvider.notifier);
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              '投稿',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          color: const Color.fromARGB(255, 225, 222, 222),
                          // ),
                          child: const Text(
                            '農業の楽しさを入力',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(20),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.1,
                                ),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  await notifier.pickImage();
                                },
                                child: Stack(
                                  children: [
                                    const Positioned(
                                      top: 0,
                                      left: 3,
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: state.imagefiles == null
                                          ? const Icon(Icons.camera_alt_rounded)
                                          : Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: FileImage(
                                                    state.imagefiles![0],
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            state.numberOfPictures >= 2
                                ? CameraBox(index: 2)
                                : CameraBoxWithoutPic(index: 2),
                            state.numberOfPictures >= 3
                                ? CameraBox(index: 3)
                                : CameraBoxWithoutPic(index: 3),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          child: Column(
                            children: [
                              Container(
                                color: Colors.grey[300],
                                child: TextFormField(
                                  controller: sentenceEditingController,
                                  maxLines: 10,
                                  cursorColor: Colors.black,
                                  decoration: sellTextInputDecoration.copyWith(
                                    hintText: 'その気持ち、シェアしようぜ！',
                                  ),
                                  validator: (val) {
                                    if (val!.isNotEmpty) {
                                      return null;
                                    } else {
                                      return 'その気持ちシェアしてください';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 30,
                            left: 3,
                            right: 3,
                            top: 10,
                          ),
                          child: Container(
                            color: Colors.red,
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                // if (formKey.currentState!.validate()) {
                                notifier.onPostButton(
                                  FirebaseAuth.instance.currentUser!.uid,
                                  sentenceEditingController.text,
                                  DateTime.now(),
                                  context,
                                );
                                // }
                              },
                              child: const Text(
                                '投稿',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      }),
    );
  }
}

class CameraBox extends ConsumerWidget {
  CameraBox({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sellStateProvider);
    return Container(
      margin: const EdgeInsets.all(20),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.1,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 3,
            child: Text(
              index.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: state.imagefiles == null
                ? Container()
                : Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            //  state.imagefiles?[index - 1] == null
                            //     ? FileImage(state.imagefiles![0]) :
                            FileImage(state.imagefiles![index - 1]),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class CameraBoxWithoutPic extends ConsumerWidget {
  CameraBoxWithoutPic({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sellStateProvider);
    return Container(
      margin: const EdgeInsets.all(20),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.1,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 3,
            child: Text(
              index.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
