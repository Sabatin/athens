import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/theme_model.dart';

class RankingPage extends StatelessWidget {
  RankingPage({Key? key}) : super(key: key);
  final ThemeModel theme = ThemeModel.instance;
  final ShapeBorder cardShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)));
  final containerRadius = BorderRadius.all(Radius.circular(20));
  final double cardHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, ref, Widget? child) {
        return RefreshIndicator(
          onRefresh: () async => print('Ciao'),
          child: ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 11,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0)
                    return Container();
                  else {
                    final int i = index - 1;
                    if (i == 0) //Primo posto
                      return _firstTile(context);
                    else if (i == 1) //Secondo posto
                      return _secondTile(context, i);
                    else if (i == 2) // Terzo posto
                      return _thirdTile(context, i);
                    else
                      return _rankingTile(context, i);
                  }
                }),
          ),
        );
      },
    );
  }

  Widget _firstTile(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.emoji_events_outlined,
                  size: 32, color: theme.maincolor)),
          Card(
            margin: EdgeInsets.zero,
            shape: cardShape,
            elevation: 20,
            child: Container(
              height: cardHeight,
              width: width - 65,
              decoration: BoxDecoration(
                  gradient: theme.gradient, borderRadius: containerRadius),
              child: _podioTiles(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _secondTile(BuildContext context, int i) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                '${i + 1}°',
                style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(2, 128, 144, 1),
                    fontWeight: FontWeight.w500),
              )),
          Card(
            margin: EdgeInsets.zero,
            shape: cardShape,
            elevation: 15,
            child: Container(
              height: cardHeight,
              width: width - 70,
              decoration: BoxDecoration(
                  gradient: theme.gradientList[2],
                  borderRadius: containerRadius),
              child: _podioTiles(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _thirdTile(BuildContext context, int i) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                '${i + 1}°',
                style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(250, 126, 30, 1),
                    fontWeight: FontWeight.w500),
              )),
          Card(
            margin: EdgeInsets.zero,
            shape: cardShape,
            elevation: 10,
            child: Container(
              height: cardHeight,
              width: width - 75,
              decoration: BoxDecoration(
                  gradient: theme.gradientList[1],
                  borderRadius: containerRadius),
              child: _podioTiles(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rankingTile(BuildContext context, int i) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '${i + 1}°',
                style: TextStyle(fontSize: 21),
              )),
          Card(
            margin: EdgeInsets.zero,
            shape: cardShape,
            elevation: 4,
            child: Container(
              height: cardHeight,
              width: width - 75,
              decoration: BoxDecoration(borderRadius: containerRadius),
              child: _podioTiles(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _podioTiles([Color? color]) {
    return ListTile(
      title: Text('  Mario Rossi',
          style: TextStyle(color: color, fontWeight: FontWeight.w500)),
      trailing: Text('200',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: color)),
    );
  }
}
