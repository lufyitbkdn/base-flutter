
import 'package:{{PROJECT_NAME}}/core/exception/exception.dart';
import 'package:{{PROJECT_NAME}}/models/user/user.dart';
import 'package:{{PROJECT_NAME}}/services/stream/stream_repository.dart';

class StreamService {
  StreamService() {
    _init();
  }

  late UserStream _userStream;

  UserStream get userStream => _userStream;

  late ExceptionStream _exceptionStream;

  ExceptionStream get exceptionStream => _exceptionStream;

  void _init() {
    _userStream = UserStream();
    _exceptionStream = ExceptionStream();
  }


  void disposeStream() {
    _userStream.dispose();
    _exceptionStream.dispose();
  }

  void drainStream() {
    _userStream.drainStream();
    _exceptionStream.drainStream();
    _init();
  }
}


class UserStream extends StreamSubjectRepository<User> {}
class ExceptionStream extends StreamSubjectRepository<BaseException> {}
