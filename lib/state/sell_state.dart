import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_state.freezed.dart';

final sellStateProvider = StateNotifierProvider<SellStateNotifier, SellState>(
  (ref) => SellStateNotifier(),
);

@freezed
class SellState with _$SellState {
  const factory SellState({
    @Default('potato') String isSelectedCategory,
    @Default(false) bool isLoading,
  }) = _SellState;
}

class SellStateNotifier extends StateNotifier<SellState> {
  SellStateNotifier() : super(const SellState());
  Future<void> example() async {
    state = state.copyWith(isLoading: true);
    // なんかの処理する
    state = state.copyWith(isLoading: false);
  }
}
