import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../firebase/auth.dart';
import '../firebase/firestore.dart';
import '../model/user_model/user_model.dart';
import '../sharedpreference/sharedpreference.dart';

part 'wallet_state.freezed.dart';

final walletStateProvider =
    StateNotifierProvider<WalletStateNotifier, WalletState>(
  (ref) => WalletStateNotifier(),
);

@freezed
class WalletState with _$WalletState {
  const factory WalletState({
    @Default(false) bool isLoading,
    @Default(null) UserModel? userModel,
    @Default(false) bool isSubscribed,
  }) = _WalletState;
}

class WalletStateNotifier extends StateNotifier<WalletState> {
  WalletStateNotifier() : super(const WalletState()) {
    getUser();
  }

  final Purchases purchases = Purchases();

  void setupPurchases() {
    Purchases.addCustomerInfoUpdateListener((customerInfo) {
      if (customerInfo.entitlements.active.containsKey("your_entitlement_id")) {
        executeAfterPurchase();
      }
    });
  }

  void executeAfterPurchase() {
    // Place your post-purchase logic here
    print('Purchase completed');
  }

  Future<void> getUser() async {
    state = state.copyWith(isLoading: true);
    final user = await FireStore()
        .getCurrentUserModel(FirebaseAuth.instance.currentUser!.uid);
    state = state.copyWith(
      userModel: user,
    );
    state = state.copyWith(isLoading: false);
  }

  Future<void> incrementCoins(String coin) async {
    state = state.copyWith(isLoading: true);
    int currentAmountOfCoin = int.parse(state.userModel!.coins);
    int boughtCoins = int.parse(coin);
    int totalAmountCoin = currentAmountOfCoin + boughtCoins;
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await FireStore().incrementCoin(totalAmountCoin.toString(), uid);
    state = state.copyWith(isLoading: false);
  }

  Future<void> updateCurrentAmount(String amount) async{
    state = state.copyWith(isLoading: true);
    String uid = FirebaseAuth.instance.currentUser!.uid;
    int currentAmountOfCoin =
        state.userModel!.coins == '' ? 0 : int.parse(state.userModel!.coins);
    int totalAmountCoin = currentAmountOfCoin + int.parse(amount);
    state =
        state.copyWith(userModel: UserModel(coins: totalAmountCoin.toString()));
    await FireStore().incrementCoin(totalAmountCoin.toString(), uid);
    state = state.copyWith(isLoading: false);
  }
}
