import 'dart:convert';
import 'dart:io';

import 'package:recase/recase.dart';

const _devJsonConfigFilePath = '.env/config.dev.json';
const _stagingJsonConfigFilePath = '.env/config.staging.json';
const _prodJsonConfigFilePath = '.env/config.prod.json';

const _buildConfigClassFilePath = 'lib/src/generated/build_config.g.dart';

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

  _generateEnvironment(configJson);
}

void _generateEnvironment(Map<String, dynamic> configJson) {
  if (!configJson.containsKey('dartDefine')) {
    throw Exception('Please update config file - dartDefine not found');
  }
  _generateDartDefine(configJson['dartDefine']);
}

void _generateDartDefine(Map<String, dynamic> dartDefineJson) {
  final generator = _DartDefineGenerator(
    outputPath: _buildConfigClassFilePath,
    configData: dartDefineJson,
  );
  generator.generateFile();
}

Map<String, dynamic> readJsonFile(String filePath) {
  final file = File(filePath);
  var fileContent = file.readAsStringSync();
  fileContent = fileContent.replaceAll(RegExp('.+// .+\n'), '');
  return jsonDecode(fileContent);
}

abstract class _FileGenerator {
  final String outputPath;
  final Map<String, dynamic> configData;
  final bool? isOverride;

  _FileGenerator({
    required this.outputPath,
    required this.configData,
    this.isOverride = true,
  });

  void generateFile() {
    final outputFile = File(outputPath);
    final isFileExists = outputFile.existsSync();
    if (!isFileExists) {
      outputFile.createSync(recursive: true);
    }
    if (!isFileExists || isOverride == true) {
      outputFile.writeAsStringSync(_generateContent());
    }
  }

  String _generateContent();
}

class _DartDefineGenerator extends _FileGenerator {
  _DartDefineGenerator({
    required super.outputPath,
    required super.configData,
  });

  @override
  String _generateContent() {
    String content = '';
    content += 'class BuildConfig {\n';
    content += '  const BuildConfig._();\n';
    configData.forEach((key, value) {
      content +=
          '  static const ${key.camelCase} = String.fromEnvironment(\'$key\');\n';
    });
    content += '}';
    return content;
  }
}
