import 'package:civstart/app/app.dart';

class HomeRepository {
  HomeRepository({required this.localStorageDataSource});

  final LocalStorageDataSource localStorageDataSource;

  Future<bool> loadHasSeenWelcomeMessage() async {
    final hasSeenWelcomeString = await localStorageDataSource.read(StorageKey.hasSeenWelcome);

    return hasSeenWelcomeString != null && bool.parse(hasSeenWelcomeString);
  }

  Future<void> saveHasSeenWelcomeMessage() async => localStorageDataSource.write(key: StorageKey.hasSeenWelcome, value: '${true}');
}
