class User {
  String publicKey = '';

  User(Map<String, dynamic> userMap) {
    if (userMap.containsKey('public_key')) {
      publicKey = userMap['public_key'];
    }
  }
}