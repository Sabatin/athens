import 'dart:convert';
/*
import 'package:http/http.dart' as http;


class ConsciousBackend {
  static final String _backendURL = 'https://us-central1-consciousbackend.cloudfunctions.net';

  static Future<Map<String, dynamic>> post(String functionName, Map<String, dynamic> body) async {
    final http.Response response = await http.post(
      Uri.parse('${_backendURL}/$functionName'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(body),
    ).timeout(Duration(seconds: 30), onTimeout: () {
      throw(408);
    });

    if (response.statusCode != 200) {
      //TODO: Write better error code
      throw('Post error');
    }

    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> get(String functionName) async {
    final http.Response response = await http.get(
      Uri.parse('${_backendURL}/$functionName'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8'
      },
    ).timeout(Duration(seconds: 30), onTimeout: () {
      throw(408);
    });

    if (response.statusCode != 200) {
      print('ayayayayayyaya');
      print(response.statusCode);
      print(response.body);
      //TODO: Write better error code
      throw('Get error');
    }

    return jsonDecode(response.body);
  }
}
*/