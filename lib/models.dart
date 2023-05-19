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
