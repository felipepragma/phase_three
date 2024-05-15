import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:api_call_package/data/datasource/api_datasource_interface.dart';
import 'package:api_call_package/data/datasource/api_error.dart';
import 'package:api_call_package/data/datasource/api_url_base.dart';
import 'package:api_call_package/data/datasource/either_api.dart';
import 'package:api_call_package/data/mappers/list_categories_mapper.dart';
import 'package:api_call_package/data/mappers/list_products_mapper.dart';
import 'package:api_call_package/data/models/product_model.dart';

///
/// [ApiDatasourceImplements] Implemnetation to DataSource
/// 
/// [_client] : Inject http client [http.Client] to api call
///
/// [getAllProducts] : method for api call get all products
/// [getProductById] : method for api call get product by id
/// [getCategories] : method for api call get all categories
/// 
class ApiDatasourceImplements extends ApiDatasourceInterface {

  final http.Client _client;

  ApiDatasourceImplements({required http.Client client}) : _client = client;
  
  /// Get all products is a future method.
  ///
  /// Return a Either class
  /// [ApiError] : Return error to api call
  /// [List<ProductModel>] Return succes of list products
  @override
  Future<Either<ApiError, List<ProductModel>>> getAllProducts() async {
    final response = get(ApiUrlBase.getAllProducts, _client, (json) => LisProductsMapper().productsModelFromMap(json));
    return response;
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
    final response = get(ApiUrlBase.getProductById(id), _client, (json) => ProductModel().fromJson(json));
    return response;
  }

  /// Get all categories of product is a future method.
  ///
  /// Return a Either class
  /// [ApiError] : Return error to api call
  /// [List<String>] Return succes of list products
  @override
  Future<Either<ApiError, List<String>>> getCategories() {
    final response = get(ApiUrlBase.getCategories, _client, (json) => ListCategoriesMapper().categoriesModelFromMap(json));
    return response;
  }
}