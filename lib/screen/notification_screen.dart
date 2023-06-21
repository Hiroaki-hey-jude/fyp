import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/screen/delivery_screen.dart';
import 'package:fyp/screen/widgets/widget.dart';
import 'package:fyp/state/home_state.dart';
import 'package:fyp/state/notification_state.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends ConsumerWidget {
  NotificationScreen({super.key});

  final TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationStateProvider);
    final notifier = ref.watch(notificationStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Scaffold(
        body: state.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.orders.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        nextScreen(
                            context,
                            DeliveryScreen(
                                orderId: state.orders[index].orderId));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(),
                            top: BorderSide(),
                          ),
                        ),
                        child: ListTile(
                          leading: cropPicturesWidget(
                            state.orders[index].cropId,
                          ),
                          title: cropPTitleWidget(state.orders[index].cropId),
                          subtitle: Text(state.orders[index].status),
                          trailing: const Icon(Icons.navigate_next),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
