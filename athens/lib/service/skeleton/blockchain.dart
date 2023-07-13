
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:math';
import 'dart:io';
import 'package:athens/service/skeleton/authentication.dart';
import 'package:athens/service/skeleton/database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web3dart/web3dart.dart';

class Blockchain {
  static String publicKey = '';
  static final String apiUrl = 'http://127.0.0.1:8545/';
  static final String WWTAddress = '0x444Eb467D80B7c1471BC8DA8a671C44c1bC601De';
  // static final DeployedContract WWTContract = DeployedContract(ContractAbi.fromJson(WWTABI g, "WWT"), EthereumAddress.fromHex(WWTAddress));


  static getDeployedContract() async {
    final abiCode = await rootBundle.loadString("assets/ABI/WWT.json");
    final DeployedContract contract = DeployedContract(ContractAbi.fromJson(abiCode, "WWT"), EthereumAddress.fromHex(WWTAddress));
    return contract;
  }

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

  static getBalanceOf(String address) async {
    final client = Web3Client(apiUrl, Client());
    final WWTContract = await getDeployedContract();
    final balance = await client.call(contract: WWTContract, function: WWTContract.function('balanceOf'), params: [EthereumAddress.fromHex(address)]);
    return balance;
  }


}