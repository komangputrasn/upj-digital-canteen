import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/models.dart';

class SelectedFoodsProvider extends ChangeNotifier {
  List<FoodModel> foodModels = [];
  List<int> itemSubtotals = [];

  void addOrder(FoodModel order) {
    foodModels.add(order);
    itemSubtotals.add(order.getHarga);
    notifyListeners();
  }

  List<FoodModel> get getFoodModels => foodModels;

  bool contains(String foodName) {
    return foodModels.any((element) => element.getName == foodName);
  }

  void modifySubtotal(int itemIndex, int multiplier) {
    itemSubtotals[itemIndex] = foodModels[itemIndex].getHarga * multiplier;
    notifyListeners();
  }

  int getItemSubtotal(int itemIndex) {
    return itemSubtotals[itemIndex];
  }

  void removeOrderByIndex(int index) {
    foodModels.removeAt(index);
    itemSubtotals.removeAt(index);
    notifyListeners();
  }

  void removeOrder(FoodModel model) {
    removeOrderByIndex(foodModels.indexOf(model));
  }

  void removeOrderByName(String foodName) {
    foodModels.removeWhere(
      (element) => (element.getName == foodName),
    );
  }

  int getTotalCost() {
    return itemSubtotals.reduce((value, element) => value + element);
  }
}
