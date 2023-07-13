import 'package:athens/screens/overview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      primaryColorLight: Colors.white,
      primaryColorDark: Colors.grey[850],
      //primaryColor: Colors.white,
      fontFamily: 'Google Sans',
      appBarTheme: AppBarTheme(
        //brightness: _setStatusBarColor(brightness),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 25,
        ),
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.8)),
      ),
      scaffoldBackgroundColor: Colors.white,

      textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.black)),
    );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Conscious',
        theme: theme,
        home: Overview());
  }
}
