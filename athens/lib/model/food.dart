class Food {
  late final String name;
  late final String description;
  late final int price;

  Food(this.name, this.description, this.price);
  Food.fromMap(Map<String, dynamic> foodMap) {
    name = foodMap['name'];
    description = foodMap['description'];
    price = foodMap['price'];
  }
}