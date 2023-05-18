import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/checkout.dart';
import 'package:upj_digital_canteen/screens/pembeli/homescreen/advert_carousel.dart';
import 'package:upj_digital_canteen/screens/pembeli/homescreen/app_bar.dart';
import 'package:upj_digital_canteen/screens/pembeli/homescreen/drawer.dart';
import 'package:upj_digital_canteen/screens/pembeli/homescreen/pick_up_button.dart';
import 'package:upj_digital_canteen/screens/pembeli/homescreen/resto_food_list.dart';
import 'package:upj_digital_canteen/screens/pembeli/homescreen/search_bar.dart';

import '../../../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerView(),
      ),
      backgroundColor: Colors.red.shade50,
      body: CustomScrollView(
        slivers: [
          HomeAppBar(),
          SearchBar(),
          AdvertCarousel(),
          PickUp(),
          RestoFoodList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(kThemeColor),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Checkout(),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
