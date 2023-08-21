import 'dart:convert';
import 'dart:io';

const _devJsonConfigFilePath = './configs/.env/config.dev.json';
const _stagingJsonConfigFilePath = './configs/.env/config.staging.json';
const _prodJsonConfigFilePath = './configs/.env/config.prod.json';

void main(List<String>? args) {
  if (args?.isEmpty == true) {
    return;
  }
  Map<String, dynamic>? configJson;
  if (args?.first == 'dev') {
    configJson = readJsonFile(_devJsonConfigFilePath);
  } else if (args?.first == 'staging') {
    configJson = readJsonFile(_stagingJsonConfigFilePath);
  } else if (args?.first == 'prod') {
    configJson = readJsonFile(_prodJsonConfigFilePath);
  }
  if (configJson == null) {
    return;
  }

  List<String> arguments = [];

  if (!configJson.containsKey('dartDefine')) {
    throw Exception('Please update config file - dartDefine not found');
  }
  final dartDefine = _getDartDefine(configJson['dartDefine']);

  arguments = [
    '-t',
    'lib/main.dart',
    '--flavor',
    args?.first ?? '',
    dartDefine,
  ];

  print('To run the project, run the following commands:\n');
  print('- cd app');
  print('- fvm flutter run ${arguments.join(' ')}');
}

String _getDartDefine(Map<String, dynamic> configData) {
  String dartDefine = '';
  configData.forEach((key, value) {
    dartDefine += '--dart-define $key=$value ';
  });
  return dartDefine.trim();
}

Map<String, dynamic> readJsonFile(String filePath) {
  final file = File(filePath);
  var fileContent = file.readAsStringSync();
  fileContent = fileContent.replaceAll(RegExp('.+// .+\n'), '');
  return jsonDecode(fileContent);
}
