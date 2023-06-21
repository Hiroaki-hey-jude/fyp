import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/firebase/firestore.dart';

import '../model/order_model/order_model.dart';

part 'notification_state.freezed.dart';

final notificationStateProvider =
    StateNotifierProvider.autoDispose<NotificationStateNotifier, NotificationState>(
  (ref) => NotificationStateNotifier(),
);

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(false) bool isLoading,
    @Default([]) List<OrderModel> orders,
  }) = _NotificationState;
}

class NotificationStateNotifier extends StateNotifier<NotificationState> {
  NotificationStateNotifier() : super(const NotificationState()) {
    getUnsettledOrders();
  }

  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
  }

  Future<void> getUnsettledOrders() async {
    print('きてます');
    state = state.copyWith(isLoading: true);
    List<OrderModel> orders = [];
    orders = await FireStore()
        .getNotifications(FirebaseAuth.instance.currentUser!.uid);
    print(orders);
    state = state.copyWith(isLoading: false, orders: orders);
  }
}
