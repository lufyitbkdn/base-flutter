import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  Future<void> launchAUrl(String uriString) async {
    final url = Uri.parse(uriString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
