class Restaurant {
  late final String id;
  late final String name;
  late final String description;
  late final String category = 'Meat';
  late final String road = 'Via Roma 1';

  Restaurant(this.name, this.description) {
    id = '';
  }
  Restaurant.fromMap(Map<String, dynamic> restaurantMap) {
    id = restaurantMap['id'];
    name = restaurantMap['name'];
    description = restaurantMap['description'];
  }
}
