import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/screen/dealings_screen.dart';
import 'package:fyp/screen/delivery_screen.dart';
import 'package:fyp/screen/orders_screen.dart';
import 'package:fyp/screen/subsc_screen.dart';
import 'package:fyp/screen/subscribers_screen.dart';
import 'package:fyp/screen/transaction_screen.dart';
import 'package:fyp/screen/widgets/widget.dart';
import 'package:fyp/state/setting_state.dart';

import '../sharedpreference/sharedpreference.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingStateProvider);
    final notifier = ref.watch(settingStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.amber,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  notifier.updateProfilePic();
                  SharedPreferencesData().getUserNameFromSF().then((value) {
                    print('koko updated??');
                    print(value);
                  });
                },
                child: const Text(
                  '保存',
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
        title: const Text(
          'Direct',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(
                FocusNode(),
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 150,
                                    child: CircleAvatar(
                                      radius: 120,
                                      backgroundImage: state.imageFile == null
                                          ? NetworkImage(state.originalImgURL)
                                              as ImageProvider
                                          : FileImage(state.imageFile!),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -5.0,
                                    right: -5.0,
                                    child: RawMaterialButton(
                                      fillColor: Colors.green,
                                      onPressed: () async {
                                        await notifier.openImagePicker();
                                        // nextScreen(context, const SettingScreen());
                                      },
                                      shape: const CircleBorder(),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '名前',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextField(
                              controller: TextEditingController(
                                text: state.userModel!.name,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                label: const Text(
                                  '編集',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onChanged: (text) {
                                notifier.changeUserName(text);
                              },
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(state.userModel!.email)
                        ],
                      ),
                      const Divider(height: 50),
                      GestureDetector(
                        onTap: () {
                          nextScreen(context, SubscScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'サブスクしている農家',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                      const Divider(height: 50),
                      GestureDetector(
                        onTap: () {
                          nextScreen(context, SubscribersScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'パスを買ってくれたユーザ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                      const Divider(height: 50),
                      GestureDetector(
                        onTap: () {
                          nextScreen(
                              context,
                              OrdersScreen(
                                uid: state.userModel!.uid,
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '購入した商品',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                      const Divider(height: 50),
                      GestureDetector(
                        onTap: () {
                          nextScreen(
                              context,
                              DealingsScreen(
                                uid: state.userModel!.uid,
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '取引中の商品',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                      const Divider(height: 50),
                      GestureDetector(
                        onTap: () {
                          nextScreen(context, TransactionScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '購入コイン履歴',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                      const Divider(height: 50),
                      SizedBox(
                        // color: Colors.green,
                        width: MediaQuery.of(context).size.width,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 205, 201, 201),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () {
                            popupForLogout(context);
                          },
                          child: const Text(
                            'Log Out',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 20),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
