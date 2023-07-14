import 'package:athens/model/user.dart';
import 'package:athens/screens/authentication/login_page.dart';
import 'package:athens/screens/overview.dart';
import 'package:athens/screens/utils/routing.dart';
import 'package:athens/service/skeleton/authentication.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> start() async {
    if (Authentication.isLoggedIn()) {
      await Authentication.user.init();
      Routing.moveToPage(context, Overview());
    } else {
      Routing.moveToPage(context, LoginPage());
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      start();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(247, 242, 231, 1),
        body: Container(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/icons/icon.png',
            height: 600,
            width: 600,
            fit: BoxFit.contain,
            key: ValueKey(1),
          ),
        ));
  }
}
