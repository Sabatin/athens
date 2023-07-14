
import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:math';
import 'dart:io';
import 'package:athens/model/user.dart';
import 'package:athens/service/skeleton/authentication.dart';
import 'package:athens/service/skeleton/database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web3dart/web3dart.dart';

class Blockchain {
  static late Credentials credentials;
  static final String apiUrl = 'https://rpc.sepolia.org/';
  static final String WWTAddress = '0x7B717b445Ff27d5769E6a314235bC8D617dc80b9';
  static final int chainId = 11155111;

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
    final EthPrivateKey randomCred = EthPrivateKey.createRandom(Random.secure());
    credentials = await randomCred;

    await Database.update('users', Authentication.getAuthId(), {
      'public_key': credentials.address.hex
    });

    try {
      final Wallet wallet = Wallet.createNew(credentials as EthPrivateKey, password, Random.secure());

      final File file = File('${(await getApplicationDocumentsDirectory()).path}/wallet.json');

      await file.writeAsString(wallet.toJson());
    } catch(e) {
      print(e);
      await Database.delete('users', Authentication.getAuthId());
    }
  }

  static Future<void> unlockWallet(String password) async {
    final String content = File('${(await getApplicationDocumentsDirectory()).path}/wallet.json').readAsStringSync();
    credentials = (await Wallet.fromJson(content, password)).privateKey;
  }

  static Future<int> getBalanceOf(String address) async {
    final client = Web3Client(apiUrl, Client());
    final WWTContract = await getDeployedContract();
    final balance = await client.call(contract: WWTContract, function: WWTContract.function('balanceOf'), params: [EthereumAddress.fromHex(address)]);
    return (balance.first ~/ (BigInt.from(10).pow(18))).toInt();
  }
  static sendTokensTo(String address, int amount) async {
    final client = Web3Client(apiUrl, Client());
    final WWTContract = await getDeployedContract();
    if (credentials == null) {
      throw Exception('No credentials');
    }
    BigInt amountInWei = BigInt.from(amount) * BigInt.from(10).pow(18);
    if (BigInt.from(await getBalanceOfSelf()) < amountInWei) {
      throw Exception('Insufficient funds');
    }

    final transaction = Transaction.callContract(
      contract: WWTContract,
      function: WWTContract.function('transfer'),
      parameters: [EthereumAddress.fromHex(address), amountInWei],
    );
    final response = await client.sendTransaction(credentials, transaction, chainId: chainId);
    return response;
  }


  static Future<int> getBalanceOfSelf() async {
    return await getBalanceOf(Authentication.user.publicKey);
  }
}