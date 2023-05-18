import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/models.dart';

class SelectedFoodsProvider extends ChangeNotifier {
  List<FoodModel> foodModels = [];

  void addOrder(FoodModel order) {
    foodModels.add(order);
    notifyListeners();
  }

  List<FoodModel> get getFoodModels => foodModels;

  bool contains(FoodModel order) {
    return foodModels.contains(order);
  }

  void removeOrder(int index) {
    foodModels.removeAt(index);
    notifyListeners();
  }
}
