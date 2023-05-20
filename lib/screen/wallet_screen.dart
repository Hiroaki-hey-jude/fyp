import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/model/category_model/category_model.dart';
import 'package:fyp/screen/crop_screen.dart';
import 'package:fyp/screen/feed_screen.dart';
import 'package:fyp/screen/profile_screen.dart';
import 'package:fyp/screen/sell_screen.dart';
import 'package:fyp/screen/widgets/categories.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class WalletScreen extends ConsumerWidget {
  WalletScreen({super.key});

  final TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            fontSize: 30,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () async {
                await Purchases.purchaseProduct('direct_3000_coins');
              },
              child: const Text('3000円'),
            ),
            OutlinedButton(
              onPressed: () async {
                await Purchases.purchaseProduct('direct_1000_coins');
              },
              child: const Text('1000円'),
            ),
            OutlinedButton(
              onPressed: () async {
                await Purchases.purchaseProduct('direct_1000_1m');
              },
              child: const Text('サブスク'),
            ),
          ],
        ),
      ),
    );
  }
}
