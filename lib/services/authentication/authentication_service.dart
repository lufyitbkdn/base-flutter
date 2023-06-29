import 'dart:async';

import 'package:mywo/constants/constants.dart';
import 'package:mywo/core/core.dart';
import 'package:mywo/services/services.dart';

abstract class AuthenticationServiceInterface {
  void disposeStream();

  void reSubscribeStream();

  void updateStream(AuthenticationStatus authStatus);

  Future<void> saveTokensToStorage(
    String accessToken,
    String refreshToken,
  );

  Future<void> deleteAccessToken();

  String? getAccessToken();

  String? getRefreshToken();

}

class AuthenticationService extends AuthenticationServiceInterface {
  AuthenticationService({
    CacheService? storageService,
    StreamService? appStreamService,
  }) {
    _appStreamService = appStreamService ?? locator<StreamService>();
    _storageService = storageService ?? locator<CacheService>();
    authenticationStream = _authenticationStreamController.stream;
  }

  late final CacheService _storageService;

  late final Stream<AuthenticationStatus> authenticationStream;
  late final StreamService _appStreamService;
  late final StreamController<AuthenticationStatus>
      _authenticationStreamController =
      StreamController<AuthenticationStatus>.broadcast();

  void init() {
    _emitAuthenticationStatus();
  }

  void _emitAuthenticationStatus() {
    if (_isTokensAvailable()) {
      updateStream(AuthenticationStatus.authenticated);
    } else {
      updateStream(AuthenticationStatus.unauthenticated);
    }
  }

  @override
  void disposeStream() {
    authenticationStream.drain(null);
    _authenticationStreamController.close();
  }

  @override
  void reSubscribeStream() {
    init();
  }

  @override
  void updateStream(AuthenticationStatus authStatus) =>
      _authenticationStreamController.add(authStatus);

  @override
  Future<void> saveTokensToStorage(
    String accessToken,
    String refreshToken,
  ) async {
    await _storageService.store
        .setString(StorageConstants.accessToken, accessToken);
    await _storageService.store
        .setString(StorageConstants.refreshToken, refreshToken);
  }

  bool _isTokensAvailable() {
    final _accessToken = getAccessToken();
    final _refreshToken = getRefreshToken();
    if (_accessToken != null &&
        _accessToken.isNotEmpty &&
        _refreshToken != null &&
        _refreshToken.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  String? getAccessToken() =>
      _storageService.store.getString(StorageConstants.accessToken);

  @override
  String? getRefreshToken() =>
      _storageService.store.getString(StorageConstants.refreshToken);

  @override
  Future<void> deleteAccessToken() async =>
      _clearEntireStorage().then((_) => _disposeAllStream());

  Future<void> _clearEntireStorage() async => _storageService.clearUserData();

  Future<void> _disposeAllStream() async {
    _appStreamService.drainStream();
  }
}
