import 'package:athens/screens/utils/clickable.dart';
import 'package:athens/service/skeleton/blockchain.dart';
import 'package:flutter/material.dart';

import '../../constants/theme_model.dart';
import '../unlock_wallet_screen.dart';
import '../utils/routing.dart';

class SendTokens extends StatefulWidget {
  SendTokens();

  @override
  State<SendTokens> createState() => _SendTokensScreenState();
}

class _SendTokensScreenState extends State<SendTokens> {
  final ThemeModel theme = ThemeModel.instance;

  late String walletToSend;
  late double amoutToSend;

  @override
  void initState() {
    walletToSend = '';
    amoutToSend = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Send tokens'), automaticallyImplyLeading: true),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Wallet you wont to send tokens',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value!.isEmpty)
                    return 'Enter a valid password';
                  else
                    return null;
                },
                onChanged: (String p) {
                  this.walletToSend = p;
                },
                onSaved: (String? value) => this.walletToSend = value!,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Tokens you wont to send',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                validator: (String? value) {
                  if (value!.isEmpty)
                    return 'Enter a valid number';
                  else
                    return null;
                },
                onChanged: (String p) {
                  this.amoutToSend = double.parse(p);
                },
                onSaved: (String? value) =>
                    this.amoutToSend = double.parse(value!),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 55,
              width: 250,
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      Routing.slideToPage(context,
                          UnlockWalletScreen(onUnlocked: () async {
                            try {
                              await Blockchain.sendTokensTo(
                                  this.walletToSend, this.amoutToSend);
                              Navigator.pop(context);
                            } catch (e) {
                              //TODO: Display error to the user
                              print(e);
                            }
                          }));
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.maincolor,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  child: Text(
                    'Send tokens',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
