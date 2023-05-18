import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/models.dart';

class SelectedFoodsProvider extends ChangeNotifier {
  List<FoodModel> foodModels = [];

  void addOrder(FoodModel order) {
    foodModels.add(order);
    notifyListeners();
  }

  bool contains(FoodModel order) {
    return foodModels.contains(order);
  }

  void removeOrder(FoodModel model) {
    print(model.getName);
    foodModels.remove(model);
    notifyListeners();
  }
}
