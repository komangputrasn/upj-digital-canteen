class FoodModel {
  final String name;
  final String foodId;
  final String restoId;
  final String restoName;
  final String photoUrl;
  final int price;

  FoodModel(
      {required this.name,
      required this.foodId,
      required this.restoId,
      required this.restoName,
      required this.photoUrl,
      required this.price});
}
