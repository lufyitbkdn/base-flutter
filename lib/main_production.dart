import 'package:flutter/widgets.dart';

import 'package:{{PROJECT_NAME}}/app.dart';
import 'package:{{PROJECT_NAME}}/bootstrap.dart';
import 'package:{{PROJECT_NAME}}/constants/constants.dart';
import 'package:{{PROJECT_NAME}}/core/enum/app_flavours.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BuildConstants.updateEnvironment(currentEnvironment: AppFlavours.production);
  bootstrap(
    () => FlavoursConfiguration(
      appflavour: BuildConstants.getCurrentEnvironment,
      child: const App(),
    ),
  );
}
