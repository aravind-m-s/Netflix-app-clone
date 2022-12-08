import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_application/domain/core/failures/main_failure.dart';
import 'package:netflix_application/domain/hot_and_new/hot_and_new_service.dart';

import '../../domain/hot_and_new/model/hot_and_new_resp.dart';

part 'hot_and_n_ew_event.dart';
part 'hot_and_n_ew_state.dart';
part 'hot_and_n_ew_bloc.freezed.dart';

@injectable
class HotAndNEwBloc extends Bloc<HotAndNEwEvent, HotAndNEwState> {
  final HotAndNewService _hotAndNewService;
  HotAndNEwBloc(this._hotAndNewService) : super(HotAndNEwState.initial()) {
    on<LoadDataInComingSoon>((event, emit) async {
      if (state.comingSoonList.isNotEmpty) {
        return;
      }
      emit(HotAndNEwState(
          comingSoonList: [],
          everyOneIsWatchingList: state.everyOneIsWatchingList,
          isLoading: true,
          hasError: false));
      final result = await _hotAndNewService.getHotAndNewMovieData();
      final newState = result.fold(
        (MainFailure failure) => HotAndNEwState(
            comingSoonList: [],
            everyOneIsWatchingList: state.everyOneIsWatchingList,
            isLoading: false,
            hasError: true),
        (HotAndNewResp resp) => HotAndNEwState(
            comingSoonList: resp.results,
            everyOneIsWatchingList: state.everyOneIsWatchingList,
            isLoading: false,
            hasError: false),
      );
      emit(newState);
    });
    on<LoadDataInEveryoneIsWatching>((event, emit) async {
      if (state.everyOneIsWatchingList.isNotEmpty) {
        return;
      }
      emit(HotAndNEwState(
          comingSoonList: state.comingSoonList,
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));
      final result = await _hotAndNewService.getHotAndNewTVData();
      final newState = result.fold(
        (MainFailure failure) => HotAndNEwState(
            comingSoonList: state.comingSoonList,
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true),
        (HotAndNewResp resp) => HotAndNEwState(
            comingSoonList: state.comingSoonList,
            everyOneIsWatchingList: resp.results,
            isLoading: false,
            hasError: false),
      );
      emit(newState);
    });
  }
}
