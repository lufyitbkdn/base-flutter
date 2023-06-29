
import 'package:mywo/models/user/user.dart';
import 'package:mywo/services/stream/stream_subject.dart';

class StreamService {
  StreamService() {
    _init();
  }

  late StreamSubject<User> _userStream;
  StreamSubject<User> get userStream => _userStream;

  late StreamSubject<Exception> _exceptionStream;
  StreamSubject<Exception> get exceptionStream => _exceptionStream;

  void _init() {
    _userStream = StreamSubject<User>();
    _exceptionStream = StreamSubject<Exception>();
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

