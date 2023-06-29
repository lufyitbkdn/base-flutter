import 'package:{{PROJECT_NAME}}/constants/constants.dart';

String getPrivateFileUrl(String path) =>
    path.isEmpty ? '' : '${BuildConstants.getBaseURl}/api$path';
