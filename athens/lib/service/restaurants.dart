import 'package:flutter/cupertino.dart';
import 'package:transparent_image/transparent_image.dart';

import '../model/restaurant.dart';

class RestaurantsService {
  Future<List<Restaurant>> getRestaurants() async {
    return [Restaurant("Mr. Poli", "cristo"), Restaurant("Sapori Reali", "cristo")];
  }

  Future<FadeInImage> getRestaurantImage(String restaurantId) async {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      fadeInDuration: Duration(milliseconds: 150),
      fadeOutDuration: Duration(milliseconds: 150),
      fadeInCurve: Curves.easeOut,
      fadeOutCurve: Curves.easeOut,
      image: "await Storage.getUrl('clients/clientUID/profile')",
      fit: BoxFit.cover,
    );
  }
}