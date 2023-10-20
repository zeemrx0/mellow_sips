import 'dart:convert';
import 'dart:io';

const _devJsonConfigFilePath = './configs/.env/config.dev.json';
const _stagingJsonConfigFilePath = './configs/.env/config.staging.json';
const _prodJsonConfigFilePath = './configs/.env/config.prod.json';

void main(List<String>? args) async {
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

  if (!configJson.containsKey('dartDefine')) {
    throw Exception('Please update config file - dartDefine not found');
  }
  final dartDefine = _getDartDefine(configJson['dartDefine']);

  final runBuild = args?[1] ?? '';
  if (!['run', 'build'].contains(runBuild)) {
    print('$runBuild invalid');
    return;
  }

  final target = (args?.length ?? 0) > 2 ? args![2] : '';
  List<String> arguments = [];
  if (['ipa', 'apk', 'ios', 'android', 'aab'].contains(target)) {
    final buildName = (args?.length ?? 0) > 3 ? args![3] : '';
    final buildNumber = (args?.length ?? 0) > 4 ? args![4] : '';
    if (buildName.isEmpty && buildNumber.isEmpty) {
      arguments = [
        runBuild,
        target,
        '-t',
        'lib/main.dart',
        '--flavor',
        args?.first ?? '',
        ['ipa'].contains(target)
            ? "--export-options-plist=ios/ExportOptions.plist"
            : "",
        dartDefine,
      ];
    } else {
      arguments = [
        runBuild,
        target,
        '-t',
        'lib/main.dart',
        '--flavor',
        args?.first ?? '',
        ['ipa'].contains(target)
            ? "--export-options-plist=ios/ExportOptions.plist"
            : "",
        '--build-name',
        buildName,
        '--build-number',
        buildNumber,
        dartDefine,
      ];
    }
  } else {
    arguments = [
      runBuild,
      '-t',
      'lib/main.dart',
      '--flavor',
      args?.first ?? '',
      dartDefine,
    ];
  }

  if (runBuild.contains('build')) {
    var process = await Process.start(
      'bash',
      ['-c', 'fvm flutter ${arguments.join(' ')}'],
      workingDirectory: './app',
    );
    process.stdout.transform(utf8.decoder).listen((data) {
      print(data);
    });
    process.stderr.transform(utf8.decoder).listen((data) {
      print(data);
    });
  } else {
    print('To run the project, run the following commands:\n');
    print('- cd app');
    print('- fvm flutter run ${arguments.join(' ')}');
  }
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
