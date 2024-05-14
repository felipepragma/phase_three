
import 'dart:convert';

///
/// [categoriesModelFromMap] method get categories from map
/// [categoriesModelToMap] : method get string from categories
/// 
class ListCategoriesMapper {
  List<String> categoriesModelFromMap(String str) => List<String>.from(json.decode(str).map((x) => x));

  String categoriesModelToMap(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
}
