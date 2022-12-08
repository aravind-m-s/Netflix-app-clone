import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_application/domain/core/api_endpoint.dart';
import 'package:netflix_application/domain/search/model/search_response/search_resp.dart';
import 'package:netflix_application/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_application/domain/search/search_service.dart';

@LazySingleton(as: SearchService)
class SearchImplementation implements SearchService {
  @override
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoint.search,
        queryParameters: ({'query': movieQuery}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
