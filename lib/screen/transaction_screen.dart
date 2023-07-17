import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/screen/create_post.dart';
import 'package:fyp/screen/widgets/post_card_feed.dart';
import 'package:fyp/state/feed_state.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fyp/state/transaction_state.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends ConsumerWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(transactionStateProvider.notifier);
    final state = ref.watch(transactionStateProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: Colors.amber,
          ),
          title: const Text(
            'Transaction History',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.grey[300],
        body: state.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemCount: state.listOfPayment.length,
                itemBuilder: (context, index) {
                  DateTime? orderDateTime = state.listOfPayment[index].paidAt;
                  String dateString = orderDateTime != null
                      ? DateFormat('yyyy-MM-dd').format(orderDateTime)
                      : '';
                  return ListTile(
                    tileColor: Colors.grey,
                    title: Text(state.listOfPayment[index].price),
                    subtitle: Text(dateString),
                  );
                }));
  }
}
