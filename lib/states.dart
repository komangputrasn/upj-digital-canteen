import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/models.dart';

class SelectedFoodsProvider extends ChangeNotifier {
  List<OrderModel> orderModels = [];

  void addOrder(OrderModel order) {
    orderModels.add(order);
    notifyListeners();
  }

  bool contains(OrderModel order) {
    return orderModels.contains(order);
  }

  void removeOrder(OrderModel model) {
    print(model.getName);
    orderModels.remove(model);
    notifyListeners();
  }
}
