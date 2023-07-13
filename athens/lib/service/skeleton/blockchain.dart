import 'dart:math';

import 'package:web3dart/web3dart.dart';

class Blockchain {
  static String publicKey = '';
  static final String apiUrl = 'https://rpc.ankr.com/eth';
  static final String wwtAddress = '0xsdf';


  static void getPrivateKey() {
    Credentials credentials = EthPrivateKey.createRandom(Random.secure());
    publicKey = credentials.address.hex;
  }

  static int getBalance() {
    return 0;
  }
}