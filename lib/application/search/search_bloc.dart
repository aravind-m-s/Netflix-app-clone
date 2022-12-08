import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_application/domain/core/failures/main_failure.dart';
import 'package:netflix_application/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_application/domain/downloads/models/downloads.dart';
import 'package:netflix_application/domain/search/model/search_response/search_resp.dart';
import 'package:netflix_application/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._searchService, this._downloadsService)
      : super(SearchState.initial()) {
    on<Initialize>(
      (event, emit) async {
        if (state.idle.isNotEmpty) {
          emit(
            SearchState(
              searchResultList: [],
              idle: state.idle,
              isLoading: false,
              isError: false,
            ),
          );
          return;
        }
        emit(
          const SearchState(
            searchResultList: [],
            idle: [],
            isLoading: true,
            isError: false,
          ),
        );
        final result = await _downloadsService.getDownloadsImages();
        final failOrSuccess = result.fold(
          (MainFailure f) {
            return const SearchState(
              searchResultList: [],
              idle: [],
              isLoading: false,
              isError: true,
            );
          },
          (List<Downloads> list) {
            return SearchState(
              searchResultList: [],
              idle: list,
              isLoading: false,
              isError: false,
            );
          },
        );
        emit(failOrSuccess);
      },
    );

    on<SearchMovie>((event, emit) async {
      final response =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      emit(
        const SearchState(
          searchResultList: [],
          idle: [],
          isLoading: true,
          isError: false,
        ),
      );
      final resultFold = response.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idle: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchResp list) {
          return SearchState(
            searchResultList: list.results,
            idle: [],
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(resultFold);
    });
  }
}
