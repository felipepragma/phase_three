import 'package:dartz/dartz.dart';
import 'package:api_call_package/data/datasource/api_error.dart';
import 'package:api_call_package/data/models/product_model.dart';
import 'package:api_call_package/data/repositories/api_repository_implements.dart';
import 'package:api_call_package/data/repositories/api_repository_interface.dart';

///
/// [ApiCall] API entry point
///
/// [ApiRepositoryInterface] : Repository api call
///
/// [getAllProducts] : method for api call get all products
/// [getProductById] : method for api call get product by id
/// [getCategories] : method for api call get all categories
///
class ApiCall {
  late ApiRepositoryInterface _apiRepository;

  ApiCall({ApiRepositoryInterface? apiRepository}) {
    _apiRepository = apiRepository ?? ApiRepositoryImplements();
  }

  /// Get all products is a future method.
  ///
  /// Return a Either class
  /// [ApiError] : Return error to api call
  /// [List<ProductModel>] Return succes of list products
  Future<Either<ApiError, List<ProductModel>>> getAllProducts() async {
    return _apiRepository.getAllProducts();
  }

  /// Get product by id is a future method.
  /// 
  /// Parameter
  /// [id] : id product
  ///
  /// Return a Either class
  /// [ApiError] : Return error to api call
  /// [ProductModel] Return succes of one product
  Future<Either<ApiError, ProductModel>> getProductById(int id) async {
    return _apiRepository.getProductById(id);
  }

  /// Get all categories of product is a future method.
  ///
  /// Return a Either class
  /// [ApiError] : Return error to api call
  /// [List<String>] Return succes of list products
  Future<Either<ApiError, List<String>>> getCategories() async {
    return _apiRepository.getCategories();
  }
}
