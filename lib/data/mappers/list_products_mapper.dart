
import 'dart:convert';
import 'package:api_call_package/data/models/product_model.dart';

///
/// [productsModelFromMap] method get products from map
/// [productsModelToMap] : method get string from models
/// 
class LisProductsMapper {
  List<ProductModel> productsModelFromMap(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromMap(x)));

  String productsModelToMap(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
}
