import 'package:dio/dio.dart';
import 'package:mywo/core/core.dart';
import 'package:mywo/models/user/login_response.dart';
import 'package:mywo/services/services.dart';

class RefreshTokenService {
  RefreshTokenService({
    Dio? httpClient,
    AuthenticationService? authenticationService,
  }) {
    _httpClient = httpClient ?? Dio();
    _authenticationService =
        authenticationService ?? locator<AuthenticationService>();
  }

  late final Dio _httpClient;
  late final AuthenticationService _authenticationService;
  late LoginResponse _userDetails;

  Future<Response<dynamic>> refreshToken(
    RequestOptions requestOptions,
  ) async =>
      _refreshToken(requestOptions);

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    try {
      return _httpClient.request<dynamic>(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options,
      );
    } on Exception catch (e) {
      printError(e);
      throw AuthException();
    }
  }

  Future<void> _updateNewToken() async {
    if (_userDetails.refreshToken.isEmpty) {
      throw AuthException();
    }
    await _authenticationService.saveTokensToStorage(
      _userDetails.accessToken,
      _userDetails.refreshToken,
    );
  }

  Future<void> _fetchNewToken() async {
    try {

    } catch (e) {
      printError('Unable to fetch new token', exception: e);
      throw AuthException();
    }
  }

  Future<Response<dynamic>> _refreshToken(
    RequestOptions requestOptions,
  ) async {
    await _fetchNewToken();
    await _updateNewToken();
    final _request = await _retryRequest(requestOptions);
    return _request;
  }
}
