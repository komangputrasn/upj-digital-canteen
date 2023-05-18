import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upj_digital_canteen/models.dart';
import 'package:upj_digital_canteen/screens/pembeli/checkout/app_bar.dart';
import 'package:upj_digital_canteen/screens/pembeli/checkout/bottom_button.dart';
import 'package:upj_digital_canteen/screens/pembeli/checkout/order_lists.dart';
import '../../../constants.dart';
import '../../../states.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    var orders = Provider.of<SelectedFoodsProvider>(context).foodModels;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CheckoutAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Daftar Pesanan',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          (orders.isEmpty)
              ? NoOrdersContainer()
              : OrderListsView(orders: orders),
        ],
      ),
      bottomNavigationBar: BottomNavBarButton(),
    );
  }
}
