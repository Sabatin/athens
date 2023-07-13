import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator();
    }
    return CircularProgressIndicator(
      strokeWidth: 3,
      color: Theme.of(context).highlightColor,
    );
  }
}
