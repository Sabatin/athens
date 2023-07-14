import 'package:athens/screens/authentication/login_page.dart';
import 'package:athens/screens/utils/clickable.dart';
import 'package:athens/screens/utils/overlay_loader.dart';
import 'package:athens/screens/utils/routing.dart';
import 'package:athens/service/skeleton/authentication.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Clickable(
            onTap: () async {
              OverlayLoader.showLoading(context);
              try {
                await Authentication().signOut();
                OverlayLoader.unshowLoading();
                Routing.moveToPage(context, LoginPage());
              } catch(e) {
                OverlayLoader.unshowLoading();
              }
            },
            child: Container(
              height: 100,
              width: 100,
              child: Text(
                "Log Out"
              )
            )
          )
        )
      ),
    );
  }
}
