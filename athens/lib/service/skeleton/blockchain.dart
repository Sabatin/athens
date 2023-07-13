import 'dart:io';
import 'dart:math';

import 'package:athens/service/skeleton/authentication.dart';
import 'package:athens/service/skeleton/database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web3dart/web3dart.dart';

class Blockchain {
  static String publicKey = '';
  static final String apiUrl = 'https://rpc.ankr.com/eth';
  static final String wwtAddress = '0xsdf';


  static Future<EthPrivateKey> getPrivateKey(String password) async {
    final String content = File('${await getApplicationDocumentsDirectory()}/wallet.json').readAsStringSync();
    return Wallet.fromJson(content, password).privateKey;
  }


  static Future<void> generatePrivateKey(String password) async {
    final EthPrivateKey credentials = EthPrivateKey.createRandom(Random.secure());
    publicKey = credentials.address.hex;

    await Database.update('users', Authentication.getAuthId(), {
      'public_key': credentials.address.hex
    });

    try {
      final Wallet wallet = Wallet.createNew(credentials, password, Random.secure());

      final File file = File('${await getApplicationDocumentsDirectory()}/wallet.json');

      file.writeAsString(wallet.toJson());
    } catch(e) {
      await Database.delete('users', Authentication.getAuthId());
    }
  }

  static int getBalance() {
    return 0;
  }
}