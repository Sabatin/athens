import 'dart:convert';
import 'package:http/http.dart' as http;


class Backend {
  static final String _backendURL = 'https://us-central1-athens-70ac7.cloudfunctions.net';

  static Future<void> post(String functionName, Map<String, dynamic> body) async {
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

    //return jsonDecode(response.body);
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
      //TODO: Write better error code
      throw('Get error');
    }

    return jsonDecode(response.body);
  }
}
