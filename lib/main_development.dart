import 'package:civstart/app/app.dart';
import 'package:civstart/bootstrap.dart';
import 'package:civstart/firebase/firebase_options_development.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await bootstrap(() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    await DevelopmentServiceLocator().setup();
    return const App();
  });
}
