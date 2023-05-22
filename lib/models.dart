class FoodModel {
  FoodModel(this.name, this.harga, this.imageUrl, this.foodId, this.restoId);

  String name;
  int harga;
  String imageUrl;
  String foodId;
  String restoId;

  int get getHarga => harga;
  String get getName => name;
  String get getImageUrl => imageUrl;
  String get getFoodId => foodId;
  String get getRestoId => restoId;
}

class ConfirmedFoodModel {
  ConfirmedFoodModel(this.name, this.price, this.imageUrl, this.quantity);

  String name;
  int price;
  String imageUrl;
  int quantity;

  String get getName => name;
  int get getPrice => price;
  String get getImageUrl => imageUrl;
  int get getQuantity => quantity;
}
