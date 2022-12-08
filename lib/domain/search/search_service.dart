import 'package:dartz/dartz.dart';
import 'package:netflix_application/domain/core/failures/main_failure.dart';
import 'package:netflix_application/domain/search/model/search_response/search_resp.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery});
}
