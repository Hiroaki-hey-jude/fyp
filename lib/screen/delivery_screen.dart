import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/state/delivery_state.dart';

class DeliveryScreen extends ConsumerWidget {
  const DeliveryScreen({super.key, required this.orderId});
  final String orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deliveryStateProvider(orderId));
    final notifier = ref.watch(deliveryStateProvider(orderId).notifier);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 201, 201),
      appBar: AppBar(
        title: const Text(
          '配送',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: state.farmerUserModel!.uid == state.currentUid
          ? SafeArea(
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Text(
                            '配達状況',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 83, 81, 81),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: state.orderModel!.status == '発送待ち'
                                  ? OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      onPressed: () {
                                        notifier.shipping();
                                      },
                                      child: const Text(
                                        '発送をしました',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      child: state.orderModel!.status != '到着済み'
                                          ? Text('到着を待ちましょう')
                                          : Text('取引が完了しました'),
                                    ),
                            ),
                          )),
                        ),
                        const SizedBox(height: 50),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Text(
                            '配達情報',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 83, 81, 81),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.orderModel!.address!.prefecture),
                                Text(state.orderModel!.address!.city),
                                Text(state.orderModel!.address!.zipCode)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            )
          : SafeArea(
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Text(
                            '配達状況',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 83, 81, 81),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: state.orderModel!.status == '発送済み'
                                  ? OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      onPressed: () {
                                        notifier.arrived();
                                      },
                                      child: const Text(
                                        '到着しました',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      child: state.orderModel!.status == '発送待ち'
                                          ? Text('発送待ち')
                                          : const Text('取引が完了しました'),
                                    ),
                            ),
                          )),
                        ),
                        const SizedBox(height: 50),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Text(
                            '配達情報',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 83, 81, 81),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.orderModel!.address!.prefecture),
                                Text(state.orderModel!.address!.city),
                                Text(state.orderModel!.address!.zipCode)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
    );
  }
}
