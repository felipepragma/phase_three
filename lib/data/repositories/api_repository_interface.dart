import 'package:dartz/dartz.dart';
import 'package:api_call_package/data/datasource/api_error.dart';
import 'package:api_call_package/data/models/product_model.dart';

///
/// [ApiRepositoryInterface] Interface to Repository
///
/// [getAllProducts] : method for api call get all products
/// [getProductById] : method for api call get product by id
/// [getCategories] : method for api call get all categories
/// 
abstract class ApiRepositoryInterface {
 Future<Either<ApiError, List<ProductModel>>> getAllProducts();
 Future<Either<ApiError, ProductModel>> getProductById(int id);
 Future<Either<ApiError, List<String>>> getCategories();
}