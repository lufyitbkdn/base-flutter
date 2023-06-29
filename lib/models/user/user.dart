

import 'package:json_annotation/json_annotation.dart';
import 'package:mywo/core/core.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends IBaseDataModel<User> {
  User({
    this.id = 0,
    this.firstName,
    this.lastName,
    this.email = '',
    this.accessToken = '',
    this.refreshToken = '',
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  static const tableName = 'users';
  static const primaryKey = 'id';

  final int id;
  String? firstName;
  String? accessToken;
  String? refreshToken;
  String? lastName;
  String? email;
  @override
  User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String getTableName() => tableName;

  @override
  String getPrimaryKey() => primaryKey;

  @override
  int get primaryKeyValue => id;

  @override
  User fromMap(Map<String, dynamic> map) => User.fromJson(map);

  @override
  Map<String, dynamic> toMap() => toJson();
}
