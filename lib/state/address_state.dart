import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_state.freezed.dart';

final addressStateProvider =
    StateNotifierProvider<AddressStateNotifier, AddressState>(
  (ref) => AddressStateNotifier(),
);

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    @Default(false) bool isLoading,
  }) = _AddressState;
}

class AddressStateNotifier extends StateNotifier<AddressState> {
  AddressStateNotifier() : super(const AddressState());

  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
  }

  Future<void> storeAddressData(
    String zipCode,
    String prefeture,
    String city,
    String number,
  ) async {
    print(zipCode);
  }
}
