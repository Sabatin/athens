import 'package:flutter/material.dart';

import '../../constants/theme_model.dart';

class UserProfile extends StatelessWidget {
  final ThemeModel theme = ThemeModel.instance;
  final containerRadius = BorderRadius.all(Radius.circular(20));
  UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
          child: Text(
            'YOUR IMPACT ON FOOD WASTE',
            style: TextStyle(
              fontSize: 18,
              color: theme.secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        gradient: theme.gradientList[5],
                        borderRadius: containerRadius),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.currency_bitcoin_outlined,
                            size: 36, color: Colors.white),
                        SizedBox(height: 5),
                        Text(
                          '350',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        gradient: theme.gradientList[5],
                        borderRadius: containerRadius),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.emoji_events_outlined,
                            size: 36, color: Colors.white),
                        SizedBox(height: 5),
                        Text(
                          '200',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        gradient: theme.gradientList[5],
                        borderRadius: containerRadius),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delivery_dining_outlined,
                            size: 36, color: Colors.white),
                        SizedBox(height: 5),
                        Text(
                          '15',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.settings_outlined, color: Colors.black),
                title: Text('Settings'),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.black, size: 20),
              ),
              ListTile(
                leading: Icon(Icons.store_outlined, color: Colors.black),
                title: Text('Orders'),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.black, size: 20),
              ),
              ListTile(
                leading: Icon(Icons.help_outline, color: Colors.black),
                title: Text('Help Center'),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.black, size: 20),
              ),
              ListTile(
                leading: Icon(Icons.article_outlined, color: Colors.black),
                title: Text('Blog'),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.black, size: 20),
              ),
              ListTile(
                leading:
                    Icon(Icons.library_books_outlined, color: Colors.black),
                title: Text('Legal stuff'),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.black, size: 20),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Text(
            'TRASFER YOUR COINS',
            style: TextStyle(
              fontSize: 18,
              color: theme.secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 175,
                child: IgnorePointer(
                  child: ElevatedButton(
                      onPressed: () {},
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
                        'Send',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      )),
                ),
              ),
              Container(
                height: 50,
                width: 175,
                child: IgnorePointer(
                  child: ElevatedButton(
                      onPressed: () {},
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
                        'Receive',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
