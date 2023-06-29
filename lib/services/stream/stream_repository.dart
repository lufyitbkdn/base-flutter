import 'package:{{PROJECT_NAME}}/services/stream/abstract_stream.dart';
import 'package:rxdart/rxdart.dart';

class StreamSubjectRepository<T> extends AppStreamSubjectInterface<T> {
  late final _openStreamSubject = BehaviorSubject<T?>();

  Stream<T?> get stream => _openStreamSubject;

  @override
  void dispose() {
    _openStreamSubject.close();
    drainStream();
  }

  @override
  void drainStream() {
    _openStreamSubject.add(null);
  }

  @override
  void updateSubject(T? data) {
    _openStreamSubject
      ..add(data)
      ..asBroadcastStream();
  }

  bool get hasData =>
      _openStreamSubject.hasValue && _openStreamSubject.valueOrNull != null;
}
