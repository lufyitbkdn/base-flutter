import 'package:dio/dio.dart';
import 'package:{{PROJECT_NAME}}/models/user/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/login')
  Future<LoginResponse> login(
    @Field('email') String email,
    @Field('password') String password,
  );
}
