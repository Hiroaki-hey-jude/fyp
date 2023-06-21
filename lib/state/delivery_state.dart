import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp/firebase/firestore.dart';
import 'package:fyp/model/order_model/order_model.dart';
import 'package:fyp/model/user_model/user_model.dart';

part 'delivery_state.freezed.dart';

final deliveryStateProvider =
    StateNotifierProvider.family<DeliveryStateNotifier, DeliveryState, String>(
  (ref, orderId) => DeliveryStateNotifier(orderId),
);

@freezed
class DeliveryState with _$DeliveryState {
  const factory DeliveryState({
    @Default(false) bool isLoading,
    @Default(null) OrderModel? orderModel,
    @Default(null) UserModel? farmerUserModel,
    @Default('') String currentUid,
  }) = _DeliveryState;
}

class DeliveryStateNotifier extends StateNotifier<DeliveryState> {
  DeliveryStateNotifier(orderId) : super(const DeliveryState()) {
    getOrderedCrop(orderId);
  }

  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
  }

  Future<void> getOrderedCrop(String orderId) async {
    state = state.copyWith(isLoading: true);
    OrderModel order = await FireStore().getOrderedModel(orderId);
    state = state.copyWith(orderModel: order);
    getFarmer(state.orderModel!.farmerUid);
    state = state.copyWith(isLoading: false);
  }

  Future<void> getFarmer(String farmerUid) async {
    UserModel farmer = await FireStore().getFarmerUserModel(farmerUid);
    state = state.copyWith(
      farmerUserModel: farmer,
      currentUid: FirebaseAuth.instance.currentUser!.uid,
    );
  }

  Future<void> shipping() async {
    state = state.copyWith(isLoading: true);
    FireStore().shipping(state.orderModel!.orderId);
    OrderModel order =
        await FireStore().getOrderedModel(state.orderModel!.orderId);
    state = state.copyWith(isLoading: false, orderModel: order);
  }

  Future<void> arrived() async {
    state = state.copyWith(isLoading: true);
    FireStore().arrived(state.orderModel!.orderId);
    OrderModel order =
        await FireStore().getOrderedModel(state.orderModel!.orderId);
    state = state.copyWith(isLoading: false, orderModel: order);
  }
}
