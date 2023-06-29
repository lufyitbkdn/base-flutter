import 'package:dio/dio.dart';
import 'package:{{PROJECT_NAME}}/constants/constants.dart';
import 'package:{{PROJECT_NAME}}/core/core.dart';
import 'package:{{PROJECT_NAME}}/models/response_message/response_message.dart';
import 'package:{{PROJECT_NAME}}/models/user/login_response.dart';
import 'package:{{PROJECT_NAME}}/services/services.dart';

abstract class UserRepositoryInterface {
  Future<LoginResponse?> login(String email, String pin);

  Future<ResponseMessage?> resetPIN(String email);

  Future<ResponseMessage?> updatePIN(
    String tmpPin,
    String newPin,
    String? accessToken,
  );

  void logout();
}

class UserRepository extends UserRepositoryInterface {
  UserRepository({
    HttpService? httpService,
  })  : _httpService = httpService ?? locator<HttpService>(),
        super();
  final HttpService _httpService;

  @override
  Future<LoginResponse?> login(String email, String password) async {
    final _loginParameter = '{"email":"$email", '
        '"password":"$password", '
        '}';
    final _loginUrl = EndPoints.loginPath;
    final _response = await _httpService.post<LoginResponse, LoginResponse>(
      _loginUrl,
      parseModel: LoginResponse(),
      data: _loginParameter,
    );
    if (_response != null) {
      _response.user.accessToken = _response.accessToken;
    }
    return _response;
  }

  @override
  Future<ResponseMessage?> updatePIN(
    String tmpPin,
    String newPin,
    String? accessToken,
  ) async {
    final _loginParameter = '{'
        '"tempPin":"$tmpPin", '
        '"newPin":"$newPin"'
        '}';
    final _loginUrl = EndPoints.profilePath;
    return _httpService.put<ResponseMessage, ResponseMessage>(
      _loginUrl,
      parseModel: ResponseMessage(),
      data: _loginParameter,
      options: Options(
        headers:
            accessToken != null ? {'Authorization': 'Bearer $accessToken'} : {},
      ),
    );
  }

  @override
  void logout() {
    printDebug('logout');
    throw UnimplementedError();
  }

  @override
  Future<ResponseMessage?> resetPIN(String email) async {
    final _data = '{"email":"$email"}';
    final _loginUrl = EndPoints.resetPINPath;
    return _httpService.post<ResponseMessage, ResponseMessage>(
      _loginUrl,
      parseModel: ResponseMessage(),
      data: _data,
    );
  }
}
