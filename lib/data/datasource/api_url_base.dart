
///
/// [ApiUrlBase] Url´s base
/// 
/// [_baseUrl] : Url base
/// [getAllProducts] : Url get all products
/// [getProductById] : Url get product by id
/// [getCategories] : Url get categories
/// 
class ApiUrlBase {
  static const _baseUrl = 'https://fakestoreapi.com/';

  static String getAllProducts = '${_baseUrl}products';
  static String getProductById(int id) => '${_baseUrl}products/$id';
  static String getCategories = '${_baseUrl}products/categories';
}