import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/screen/widgets/widget.dart';
import 'package:fyp/state/home_state.dart';
import 'package:fyp/state/order_state.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends ConsumerWidget {
  OrdersScreen({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderStateProvider(uid));
    final notifier = ref.watch(orderStateProvider(uid).notifier);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.amber,
        ),
        title: const Text(
          'Direct',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                  DateTime? orderDateTime = state.orders[index].orderAt;
                  String dateString = orderDateTime != null
                      ? DateFormat('yyyy-MM-dd').format(orderDateTime)
                      : '';
                  return ListTile(
                    tileColor: Color.fromARGB(255, 212, 207, 207),
                    leading: cropPicturesWidget(
                      state.orders[index].cropId,
                    ),
                    // title: Text(state.orders[index].cropId),
                    title: cropPTitleWidget(state.orders[index].cropId),
                    subtitle: Text(dateString),
                  );
                },
              ),
            ),
    );
  }
}
