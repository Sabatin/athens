import 'package:athens/service/skeleton/authentication.dart';
import 'package:athens/service/skeleton/database.dart';

class FoodUser {
  static String fullName = '';
  static String publicKey = '';
  static int points = 0;

  static Future<void> init() async {
    try {
      if (Authentication.isLoggedIn()) {
        final userData = await Database.get('users', Authentication.getAuthId());
        fullName = userData['full_name'];
        points = userData['points'];
        if (userData.containsKey('public_key')) {
          publicKey = userData['public_key'];
        }
      }
    } catch(ignored) {}
  }

  static Future<void> create(String name) async {
    await Database.post('users', Authentication.getAuthId(), {
      'full_name': fullName,
      'points': 0
    });
    fullName = name;
  }
}