import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  final response = await http.get(Uri.https('www.veteransemployment.gov.au', 'veterans/identify-your-skills'));
  final document = parse(response.body);

  final rankItems = document.querySelectorAll('.rank__item');

  final stringBuffer = StringBuffer() //
    ..writeln('const rankedHardSkills = [');

  for (final rankItem in rankItems) {
    final rank = rankItem.querySelector('h3')?.text;
    stringBuffer
      ..writeln('  RankedHardSkill(')
      ..writeln("    rank: '$rank',")
      ..writeln('    hardSkills: [');
    final skills = rankItem //
        .querySelectorAll('.views-field-field-skills2 p')
        .map((p) => p.text)
        .map((text) => text.replaceFirst('• ', ''))
        .where((text) => text.trim().isNotEmpty)
        .where((text) => !text.startsWith('For more detailed information'))
        .where((text) => !text.startsWith('For detailed information'))
        .toList();

    for (final skill in skills) {
      stringBuffer.writeln("      '$skill',");
    }
    stringBuffer
      ..writeln('    ],')
      ..writeln('  ),');
  }

  stringBuffer.writeln('];');

  // ignore: avoid_print
  print(stringBuffer);
}
