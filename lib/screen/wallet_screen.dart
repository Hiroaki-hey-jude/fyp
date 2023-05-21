import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/model/user_model/user_model.dart';
import 'package:fyp/state/wallet_state.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void executeAfterPurchase() {
      // Place your post-purchase logic here
      print('Purchase completed');
    }

    void setupPurchases() {
      Purchases.addCustomerInfoUpdateListener((customerInfo) {
        if (customerInfo.entitlements.active
            .containsKey("your_entitlement_id")) {
          executeAfterPurchase();
        }
      });
    }

    void yourFunctionToExecuteAfterSuccessfulPurchase() {
      // Place your logic to execute after a successful purchase here
      print('Purchase successful');
    }

    // Future<void> purchaseProduct() async {
    //   try {
    //     final PurchaserInfo purchaserInfo =
    //         await Purchases.purchaseProduct('direct_1000_coins');
    //     if (result?.purchaserInfo?.entitlements?.active
    //             ?.containsKey("your_entitlement_id") ??
    //         false) {
    //       yourFunctionToExecuteAfterSuccessfulPurchase();
    //     }
    //   } catch (e) {
    //     debugPrint('Failed to purchase the coin');
    //   }
    // }

    final state = ref.watch(walletStateProvider);
    final notifier = ref.watch(walletStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.amber,
        ),
        title: const Text(
          'Direct Wallet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        elevation: 0,
      ),
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.white),
            )
          : Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 50),
                        child: Transform.rotate(
                          angle: 0, // 斜めの傾きを調整するために角度を変更してください
                          child: Container(
                            // Customize the design properties
                            width: double.infinity,
                            height: 200,
                            margin: const EdgeInsets.all(16.0),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Background Wallet Design

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 50),
                        child: Transform.rotate(
                          angle:
                              -0.1, // 斜めの傾きflutter revnue catを調整するために角度を変更してください
                          child: Container(
                            // Customize the design properties
                            width: double.infinity,
                            height: 200,
                            margin: const EdgeInsets.all(16.0),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.green, Colors.lightBlue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 110.0,
                        left: 24.0,
                        right: 24.0,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                '残高',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              state.userModel!.coins == ''
                                  ? const Text(
                                      '0 Coin',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Text(
                                      '${state.userModel!.coins}Coin',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '残高をチャージする',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    width: MediaQuery.of(context).size.width / 3,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 201, 207, 202),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          final isSuccess = await Purchases.purchaseProduct(
                              'direct_1000_coins');
                          if (isSuccess
                              .entitlements.all["grant_coins"]!.isActive) {
                            print('ここきてますか');
                            notifier.updateCurrentAmount('1000');
                          }
                        } catch (e) {
                          debugPrint('Faled to purchase the coin');
                        }
                      },
                      child: const Text(
                        '1000 Coin',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 3,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 201, 207, 202),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          final isSuccess = await Purchases.purchaseProduct(
                              'direct_3000_coins');
                          if (isSuccess
                              .entitlements.all["grant_coins"]!.isActive) {
                            notifier.updateCurrentAmount('3000');
                          }
                        } catch (e) {
                          debugPrint('Faled to purchase the coin');
                        }
                      },
                      child: const Text(
                        '3000 Coin',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      // : Center(
      //     child: Column(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.symmetric(vertical: 30),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               const Text(
      //                 'Credits: ',
      //                 style: TextStyle(
      //                   fontSize: 25,
      //                 ),
      //               ),
      //               const SizedBox(width: 10),
      //               state.userModel!.coins == ''
      //                   ? const Text(
      //                       '0 Coin',
      //                       style: TextStyle(
      //                         color: Colors.green,
      //                         fontSize: 25,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     )
      //                   : Text(
      //                       '${state.userModel!.coins}Coin',
      //                       style: const TextStyle(
      //                         color: Colors.green,
      //                         fontSize: 25,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //             ],
      //           ),
      //         ),
      //         OutlinedButton(
      //           onPressed: () async {
      //             try {
      //               await Purchases.purchaseProduct('direct_1000_coins');
      //             } catch (e) {
      //               debugPrint('Faled to purchase the coin');
      //             }
      //           },
      //           child: const Text('1000円'),
      //         ),
      //         OutlinedButton(
      //           onPressed: () async {
      //             try {
      //               await Purchases.purchaseProduct('direct_3000_coins');
      //             } catch (e) {
      //               debugPrint('Faled to purchase the coin');
      //             }
      //           },
      //           child: const Text('3000円'),
      //         ),
      //         OutlinedButton(
      //           onPressed: () async {
      //             try {
      //               await Purchases.purchaseProduct('direct_1000_1m');
      //             } catch (e) {
      //               debugPrint('Faled to purchase the coin');
      //             }
      //           },
      //           child: const Text('サブスク'),
      //         ),
      //       ],
      //     ),
      //   ),
    );
  }
}
