import 'package:athens/service/skeleton/authentication.dart';
import 'package:athens/service/skeleton/database.dart';

class FoodUser {
  String fullName = '';
  String publicKey = '';
  int points = 0;
  int level = 1;

  FoodUser();
  FoodUser.fromMap(Map<String, dynamic> userMap) {
    fullName = userMap['full_name'];
    points = userMap['points'];
  }

  Future<void> init() async {
    try {
      if (Authentication.isLoggedIn()) {
        print(Authentication.getAuthId());
        final userData = await Database.get('users', Authentication.getAuthId());

        fullName = userData['full_name'];
        points = userData['points'];
        level = userData['level'];
        if (userData.containsKey('public_key')) {
          publicKey = userData['public_key'];
        }
      }
    } catch(ignored) {
    }
  }

  Future<void> create(String name) async {
    await Database.post('users', Authentication.getAuthId(), {
      'full_name': name,
      'points': 0,
      'level': 1
    });
    fullName = name;
  }
}