import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:api_call_package/data/datasource/api_error.dart';

///
/// [get] Either function to get api call.
/// 
/// [Either] : Use Either class of dartz
/// 
Future<Either<ApiError, T>> get<T>(String url, http.Client client, T Function(String json) fromJson) async {
  final response = await client.get(Uri.parse(url));
    switch (response.statusCode) {
      case 200:
        final modelBase = fromJson(response.body);
        return Right(modelBase);
      case 408:
        return const Left(ApiError.requestTimeout);
      case 401:
        return const Left(ApiError.unauthorized);
      case 404:
        return const Left(ApiError.notFound);
      case 500:
        return const Left(ApiError.serverError);
      case -1:
        return const Left(ApiError.noInternetConnection);
      default:
        return const Left(ApiError.unknown);
  }
}