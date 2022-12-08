import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_application/domain/core/api_endpoint.dart';
import 'package:netflix_application/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_application/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix_application/domain/hot_and_new/model/hot_and_new_resp.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplementation implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoint.hotAndNewMovie);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTVData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoint.hotAndNewTV);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
