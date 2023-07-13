import "package:flutter/material.dart";

import "../../constants/theme_model.dart";

class ProfileCard extends StatelessWidget {
  final ShapeBorder cardShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)));
  final containerRadius = BorderRadius.all(Radius.circular(25));
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
            title: Text('Mario Rossi',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500)),
            subtitle: Text('Livello 3',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
            trailing: Text('300',
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
