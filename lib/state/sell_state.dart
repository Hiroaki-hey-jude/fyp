import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_state.freezed.dart';

final sellStateProvider = StateNotifierProvider<SellStateNotifier, SellState>(
  (ref) => SellStateNotifier(),
);

@freezed
class SellState with _$SellState {
  const factory SellState({
    @Default('potato') String selectedCategory,
    @Default('北海道') String selectedCity,
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

  void changeCategory(String selectedCategory) {
    state = state.copyWith(selectedCategory: selectedCategory);
  }

  void changeCity(String selectedCity) {
    state = state.copyWith(selectedCity: selectedCity);
  }
}
