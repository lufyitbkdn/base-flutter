import 'package:json_annotation/json_annotation.dart';
import 'package:{{PROJECT_NAME}}/core/core.dart';
import 'package:{{PROJECT_NAME}}/models/user/user.dart';

part 'login_response.g.dart';


@JsonSerializable()
class LoginResponse extends IBaseModel<LoginResponse> {
  LoginResponse({
    this.accessToken = '',
    this.refreshToken = '',
    User? user,
  }) {
    this.user = user ?? User();
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  final String accessToken;
  final String refreshToken;
  late final User user;

  @override
  LoginResponse fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
