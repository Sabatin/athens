import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/theme_model.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final ThemeModel theme = ThemeModel.instance;
  final ShapeBorder cardShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)));
  final containerRadius = BorderRadius.all(Radius.circular(25));

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: ListView(
        children: <Widget>[
          Padding(
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
          ),
          //DailyTrivia(),
          //DailyChallenge(),
          /* ConsciousClickable(
            onTap: () => Routing.slideToPage(context, Wiki()),
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 6,
              shape: cardShape,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: containerRadius,
                    child: CachedNetworkImage(
                      height: 170,
                      width: width,
                      imageUrl:
                          'https://www.copma.it/wp-content/uploads/2022/11/copma-sostenibilita.jpg',
                      imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.fitWidth))),
                      placeholder: (context, url) => ErrorImageNetwork(width),
                      errorWidget: (context, url, error) =>
                          ErrorImageNetwork(width),
                    ),
                  ),
                ],
              ),
            ),
          ), */
          //InviteFriendsCard(),
        ],
      ),
    );
  }
}

class HomeActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 20, left: 5),
        child: Icon(Icons.account_circle_outlined, size: 27));
  }
}

class ErrorImageNetwork extends StatelessWidget {
  const ErrorImageNetwork(this.height);
  final double height;

  static const String url =
      'https://user-images.githubusercontent.com/47315479/81145216-7fbd8700-8f7e-11ea-9d49-bd5fb4a888f1.png';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
          height: 150, width: width, child: const CircularProgressIndicator()),
      errorWidget: (context, url, error) => Container(
          height: 150, width: width, child: const CircularProgressIndicator()),
    );
  }
}
