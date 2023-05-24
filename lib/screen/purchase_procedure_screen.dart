import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/screen/address_screen.dart';
import 'package:fyp/screen/delivery_screen.dart';
import 'package:fyp/screen/widgets/widget.dart';
import 'package:fyp/state/purchase_state.dart';

class PurchaseProcedureScreen extends ConsumerWidget {
  const PurchaseProcedureScreen({
    super.key,
    required this.cropId,
  });

  final String cropId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    final blockSizeVertical = screenHeight / 100;
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
                      const SizedBox(width: 20),
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
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return SizedBox(
                            // 90%の高さで表示させる
                            height: blockSizeVertical * 95,
                            child: AddressScreen(cropId: cropId),
                          );
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('配送先'),
                        Row(
                          children: [
                            state.userModel!.address!.city == ''
                                ? const Text('住所を設定してくだい')
                                : Column(
                                    children: [
                                      Text(
                                          state.userModel!.address!.prefecture),
                                      Text(state.userModel!.address!.zipCode),
                                    ],
                                  ),
                            const Icon(Icons.navigate_next),
                          ],
                        ),
                        // Text(state.userModel!.address),
                      ],
                    ),
                  ),
                  const Divider(height: 70),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "購入する",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        int currentMoney;
                        if (state.userModel!.coins == '') {
                          currentMoney = 0;
                        } else {
                          currentMoney = int.parse(state.userModel!.coins);
                        }
                        int price = int.parse(state.cropModel!.price);
                        if (price > currentMoney) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('現在の残高ではこの商品は購入できません')));
                        } else {
                          notifier.purchaseCrop();
                          nextScreen(context, const DeliveryScreen());
                        }
                      },
                    ),
                  ),
                ]),
              ),
      ),
    );
  }
}
