///
/// [AbstractModelBase] abstract model base
/// 
/// [fromJson] : method get instance fromJson
/// [toJson] : method get string instance
/// 
abstract class AbstractModelBase<T> {
  T fromJson(String str);
  String toJson();
}