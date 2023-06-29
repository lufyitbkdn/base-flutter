

abstract class IBaseModel<T> {
  Map<String, dynamic> toJson();

  T fromJson(Map<String, dynamic> json);
}

abstract class IBaseDataModel<T> extends IBaseModel<T> {
  String getTableName();

  String getPrimaryKey();

  dynamic get primaryKeyValue;

  Map<String, dynamic> toMap();

  T fromMap(Map<String, dynamic> map);
}
