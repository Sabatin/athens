class Restaurant {
  late final String id;
  late final String name;
  late final String description;

  Restaurant(this.name, this.description) {
    id = '';
  }
  Restaurant.fromMap(Map<String, dynamic> restaurantMap) {
    id = restaurantMap['id'];
    name = restaurantMap['name'];
    description = restaurantMap['description'];
  }
}