import "package:athens/constants/theme_model.dart";
import "package:athens/model/user.dart";
import "package:flutter/material.dart";



class ProfileCard extends StatelessWidget {
  final ShapeBorder cardShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)));
  final containerRadius = BorderRadius.all(Radius.circular(20));
  final ThemeModel theme = ThemeModel.instance;
  ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        margin: EdgeInsets.zero,
        shape: cardShape,
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
              gradient: theme.gradient, borderRadius: containerRadius),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 22,
              child: Icon(Icons.person),
            ),
            title: Text(FoodUser.fullName,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500)),
            trailing: Text(FoodUser.points.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
