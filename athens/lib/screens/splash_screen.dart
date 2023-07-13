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
    await FoodUser.init();
    if (Authentication.isLoggedIn()) {
      Routing.slideToPage(context, Overview());
    }
    else {
      Routing.slideToPage(context, LoginPage());
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
      body: Center(
        child: Text(
          'LOGO'
        )
      )
    );
  }
}
