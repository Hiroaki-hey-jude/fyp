import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/screen/home_screen.dart';
import 'package:fyp/screen/register_screen.dart';

import '../shared/constant.dart';
import '../state/login_state.dart';
import '../state/purchase_state.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key, required this.cropId});
  final cropId;

  double deviceHeight = 0;
  final TextEditingController zipCodeEditingController =
      TextEditingController();
  final TextEditingController prefecturedEditingController =
      TextEditingController();
  final TextEditingController cityEditingController = TextEditingController();
  final TextEditingController numberEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        deviceHeight = MediaQuery.of(context).size.height;
        final state = ref.watch(purchaseStateProvider(cropId));
        final notifier = ref.watch(purchaseStateProvider(cropId).notifier);
        return state.isLoading
            ? Container(color: Constant.whiteColor)
            : GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(
                      FocusNode(),
                    ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(height: 10),
                              const Text('郵便番号(数字)'),
                              TextFormField(
                                controller: zipCodeEditingController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "例)7312323",
                                ),
                                validator: (val) {
                                  if (val!.isNotEmpty) {
                                    return null;
                                  } else {
                                    return '適正な郵便番号を入力してください';
                                  }
                                },
                              ),
                              const Divider(height: 30),
                              const Text('都道府県'),
                              TextFormField(
                                controller: prefecturedEditingController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "例)東京都",
                                ),
                                validator: (val) {
                                  if (val!.length < 6) {
                                    return "適正な都道府県を入力してください";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const Divider(height: 30),
                              const Text('市町村番地建物名'),
                              TextFormField(
                                controller: prefecturedEditingController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "例)横浜市緑区青山1-1-1東銀座1001号",
                                ),
                                validator: (val) {
                                  if (val!.length < 6) {
                                    return "適正な市町村を入力してください";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const Divider(height: 30),
                              const Text('電話番号'),
                              TextFormField(
                                controller: numberEditingController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "例)08095481234",
                                ),
                                validator: (val) {
                                  if (val!.length < 10) {
                                    return "適正な電話番号を入力してください";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const Divider(height: 30),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: const Text(
                                    '登録する',
                                    style: TextStyle(
                                      color: Constant.whiteColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    // notifier.login(
                                    //   context,
                                    //   formKey,
                                    //   emailEditingController.text,
                                    //   passwordEditingController.text,
                                    // );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ));
      }),
    );
  }
}
