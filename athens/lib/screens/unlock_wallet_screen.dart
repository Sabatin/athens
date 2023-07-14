import 'package:athens/screens/utils/clickable.dart';
import 'package:athens/service/skeleton/blockchain.dart';
import 'package:flutter/material.dart';

class UnlockWalletScreen extends StatefulWidget {
  final void Function() onUnlocked;
  UnlockWalletScreen({required this.onUnlocked});

  @override
  State<UnlockWalletScreen> createState() => _UnlockWalletScreenState();
}

class _UnlockWalletScreenState extends State<UnlockWalletScreen> {
  late String password;

  @override
  void initState() {
    password = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                'Insert password'
              ),
              SizedBox(height: 8),
              TextFormField(
                onChanged: (String p) {
                  this.password = p;
                },
              ),
              SizedBox(height: 16),
              Clickable(
                onTap: () async {
                  try {
                    await Blockchain.unlockWallet(password);
                    widget.onUnlocked();
                    Navigator.pop(context);
                  } catch(e) {

                  }
                },
                child: Container(
                  child: Text(
                    'Confirm'
                  )
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
