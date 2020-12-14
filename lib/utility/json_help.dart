// import 'dart:convert';
//
// class JsonHelper {
//   List<dynamic> decodedJsonArray;
//
//   Future<List<dynamic>> getJsonArray(String filename) async {
//     File jsonFile = File(await _localFile(filename));
//     String jsonString = jsonFile.readAsStringSync();
//
//     decodedJsonArray = jsonDecode(jsonString)['array'];
//     return decodedJsonArray;
//   }
//
//   String returnJsonString(var array) {
//     Map<String, dynamic> placeholderMap = {'array': array};
//     String jsonString = jsonEncode(placeholderMap);
//
//     return jsonString;
//   }
//
//   void writeJsonStringToFile(String filename, String jsonString) async {
//     final file = File(await _localFile(filename));
//     file.writeAsStringSync(jsonString);
//   }
//
//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();
//
//     return directory.path;
//   }
//
//   Future<String> _localFile(String filename) async {
//     final path = await _localPath;
//     print('$path/');
//     print('$path/$filename');
//     return '$path/$filename';
//   }
// }
