import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/state/purchase_state.dart';

class PurchaseProcedureScreen extends ConsumerWidget {
  const PurchaseProcedureScreen({
    super.key,
    required this.cropId,
  });

  final String cropId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(purchaseStateProvider(cropId));
    final notifier = ref.watch(purchaseStateProvider(cropId).notifier);
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          primaryFocus?.unfocus();
        },
        child: state.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(children: [
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
                        '購入手続き',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage(state.cropModel!.picsOfCrops![0]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.cropModel!.name),
                          const SizedBox(height: 5),
                          Text(
                            '${state.cropModel!.price} Coins',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Wallet 残高'),
                      state.userModel!.coins == ''
                          ? const Text(
                              '残高がありません',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          : Text(state.userModel!.coins),
                    ],
                  ),
                  const Divider(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('支払い金額'),
                      Text('${state.cropModel!.price} Coins'),
                    ],
                  ),
                  const Divider(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('配送先'),
                      Text(state.userModel!.address),
                    ],
                  ),
                ]),
              ),
      ),
    );
  }
}
