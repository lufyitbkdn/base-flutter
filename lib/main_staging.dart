import 'package:my_wo/app/app.dart';
import 'package:my_wo/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() async {
    await StagingServiceLocator().setup();
    return const App();
  });
}
