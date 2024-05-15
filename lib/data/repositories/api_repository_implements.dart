import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:api_call_package/data/datasource/api_datasource_implements.dart';
import 'package:api_call_package/data/datasource/api_datasource_interface.dart';
import 'package:api_call_package/data/datasource/api_error.dart';
import 'package:api_call_package/data/models/product_model.dart';
import 'package:api_call_package/data/repositories/api_repository_interface.dart';

///
/// [ApiRepositoryImplements] Implemnetation to Repository
/// 
/// [_dataSourceInterface] : Inject data source [ApiDatasourceInterface] to api call
///
/// [getAllProducts] : method for api call get all products
/// [getProductById] : method for api call get product by id
/// [getCategories] : method for api call get all categories
/// 
class ApiRepositoryImplements extends ApiRepositoryInterface {

  late ApiDatasourceInterface _dataSourceInterface;

  ApiRepositoryImplements({ApiDatasourceInterface? dataSourceInterface}) {
    _dataSourceInterface = dataSourceInterface ?? ApiDatasourceImplements(client: http.Client());
  }

  /// Get all products is a future method.
  ///
  /// Return a Either class
  /// [ApiError] : Return error to api call
  /// [List<ProductModel>] Return succes of list products
  @override
  Future<Either<ApiError, List<ProductModel>>> getAllProducts() async {
    return _dataSourceInterface.getAllProducts();
  }

  /// Get product by id is a future method.
  /// 
  /// Parameter
  /// [id] : id product
  ///
  /// Return a Either class
  /// [ApiError] : Return error to api call
  /// [ProductModel] Return succes of one product
  @override
  Future<Either<ApiError, ProductModel>> getProductById(int id) async {
    return _dataSourceInterface.getProductById(id);
  }

  /// Get all categories of product is a future method.
  ///
  /// Return a Either class
  /// [ApiError] : Return error to api call
  /// [List<String>] Return succes of list products
  @override
  Future<Either<ApiError, List<String>>> getCategories() {
    return _dataSourceInterface.getCategories();
  }
}
