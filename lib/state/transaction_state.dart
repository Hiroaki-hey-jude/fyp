import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/firebase/firestore.dart';
import 'package:fyp/model/payment_model/payment_model.dart';

import '../firebase/auth.dart';
import '../model/user_model/user_model.dart';
import '../sharedpreference/sharedpreference.dart';

part 'transaction_state.freezed.dart';

final transactionStateProvider =
    StateNotifierProvider<TransactionStateNotifier, TransactionState>(
  (ref) => TransactionStateNotifier(),
);

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState({
    @Default(false) bool isLoading,
    @Default([]) List<PaymentModel> listOfPayment,
  }) = _TransactionState;
}

class TransactionStateNotifier extends StateNotifier<TransactionState> {
  TransactionStateNotifier() : super(const TransactionState()) {
    getTransactionHistry();
  }

  Future<void> getTransactionHistry() async {
    state = state.copyWith(isLoading: true);
    String uid = FirebaseAuth.instance.currentUser!.uid;
    List<PaymentModel> transactionData = [];
    transactionData = await FireStore().getTransactionHistry(uid);
    state = state.copyWith(isLoading: false, listOfPayment: transactionData);
  }
}
