class FoodModel {
  FoodModel(this.name, this.harga, this.imageUrl);

  String name;
  int harga;
  String imageUrl;

  String get getName {
    return name;
  }

  int get getHarga {
    return harga;
  }

  String get getImageUrl {
    return imageUrl;
  }
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
