import 'package:flutter/material.dart';

import 'package:mywo/app.dart';
import 'package:mywo/bootstrap.dart';
import 'package:mywo/constants/constants.dart';
import 'package:mywo/core/enum/app_flavours.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BuildConstants.updateEnvironment(currentEnvironment: AppFlavours.staging);
  bootstrap(
    () => FlavoursConfiguration(
      appflavour: BuildConstants.getCurrentEnvironment,
      child: const App(),
    ),
  );
}
