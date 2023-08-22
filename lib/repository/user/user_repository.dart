import 'package:{{PROJECT_NAME}}/core/core.dart';
import 'package:{{PROJECT_NAME}}/models/user/login_response.dart';
import 'package:{{PROJECT_NAME}}/services/api/rest_client.dart';

abstract class UserRepositoryInterface {
  Future<LoginResponse?> login(String email, String password);

  void logout();
}

class UserRepository extends UserRepositoryInterface {
  UserRepository({
    RestClient? api,
  })  : _api = api ?? locator<RestClient>(),
        super();
  final RestClient _api;

  @override
  Future<LoginResponse> login(
    String email,
    String password,
  ) async {
    return _api.login(email, password);
  }

  @override
  void logout() {
  }


}
