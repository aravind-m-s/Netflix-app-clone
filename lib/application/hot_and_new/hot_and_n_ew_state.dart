part of 'hot_and_n_ew_bloc.dart';

@freezed
class HotAndNEwState with _$HotAndNEwState {
  const factory HotAndNEwState({
    required List<HotAndNewData> comingSoonList,
    required List<HotAndNewData> everyOneIsWatchingList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HotAndNEwState.initial() => const HotAndNEwState(
        comingSoonList: [],
        everyOneIsWatchingList: [],
        isLoading: false,
        hasError: false,
      );
}
