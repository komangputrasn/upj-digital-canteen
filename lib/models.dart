class FoodModel {
  FoodModel(this.name, this.harga, this.imageUrl);

  String name;
  String harga;
  String imageUrl;

  String get getName {
    return name;
  }

  String get getHarga {
    return harga;
  }

  String get getImageUrl {
    return imageUrl;
  }
}
