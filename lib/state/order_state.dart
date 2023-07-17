import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/firebase/firestore.dart';
import '../model/crop_model.dart/crop_model.dart';
import '../model/order_model/order_model.dart';
part 'order_state.freezed.dart';

final orderStateProvider = StateNotifierProvider.autoDispose
    .family<OrderStateNotifier, OrderState, String>(
  (ref, uid) => OrderStateNotifier(uid),
);

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    @Default(false) bool isLoading,
    @Default([]) List<OrderModel> orders,
    @Default([]) List<OrderModel> dealings,
    @Default([]) List<CropModel> orderedCrops,
  }) = _OrderState;
}

class OrderStateNotifier extends StateNotifier<OrderState> {
  OrderStateNotifier(uid) : super(const OrderState()) {
    getOrderedCropsSoFar(uid);
    getDealingCrops(uid);
  }
  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
  }

  Future<void> getOrderedCropsSoFar(String uid) async {
    state = state.copyWith(isLoading: true);
    List<OrderModel> orders = [];
    orders = await FireStore().getOrderedCropsSoFar(uid);
    print('$orders  ここの中身はなんだ！！！！！！');
    state = state.copyWith(isLoading: false, orders: orders);
  }

  Future<void> getDealingCrops(String uid) async {
    state = state.copyWith(isLoading: true);
    List<OrderModel> orders = [];
    orders = await FireStore().getDealingCrops(uid);
    print(orders);
    state = state.copyWith(isLoading: false, dealings: orders);
  }
}
