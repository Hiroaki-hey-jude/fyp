import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/screen/seller_profile_screen.dart';
import 'package:fyp/screen/widgets/widget.dart';
import 'package:fyp/state/profile_state.dart';
import 'package:fyp/state/setting_state.dart';

class SubscribersScreen extends ConsumerWidget {
  SubscribersScreen({super.key});

  final TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingStateProvider);
    final notifier = ref.watch(settingStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.amber,
        ),
        title: const Text(
          'PASS購入者',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView.builder(
              itemCount: state.listOfSubscribers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Color.fromARGB(255, 225, 212, 212),
                  leading: profilePicturesWidget(
                    state.listOfSubscribers[index].consumerUid,
                  ),
                  title: textUserName(
                    state.listOfSubscribers[index].consumerUid,
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(
                        color: Colors.white30,
                      ),
                    ),
                    onPressed: () {
                      nextScreen(
                          context,
                          SellerProfileScreen(
                            sellerUid:
                                state.listOfSubscribers[index].consumerUid,
                            isDiscounted: true,
                          ));
                    },
                    child: const Text(
                      'プロフィールへ',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
