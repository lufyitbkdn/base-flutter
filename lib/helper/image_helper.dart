import 'package:mywo/constants/constants.dart';

String getPrivateFileUrl(String path) =>
    path.isEmpty ? '' : '${BuildConstants.getBaseURl}/api$path';
