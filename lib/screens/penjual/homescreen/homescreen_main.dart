import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/auth.dart';
import 'package:upj_digital_canteen/firestore.dart';
import 'package:upj_digital_canteen/screens/penjual/homescreen/add_menu_bottom_sheet.dart';
import 'package:upj_digital_canteen/screens/penjual/homescreen/food_card.dart';
import 'package:upj_digital_canteen/screens/penjual/order_data/order_data.dart';
import 'package:upj_digital_canteen/screens/penjual/settings/settings_main.dart';

class MerchantHomeScreen extends StatelessWidget {
  const MerchantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      'Menu',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Makanan',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            expandedHeight: 200,
            backgroundColor: Colors.red.shade50,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MerchantSettingsScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.settings,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OrderDataScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.restaurant,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          StreamBuilder(
            stream: MerchantData()
                .getRestoFoodCollectionSnapshot(Auth().currentUser!.uid),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return SliverGrid.builder(
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final documentSnapshot = snapshot.data!.docs[index];
                    return FoodCard(
                      id: documentSnapshot.id,
                      foodName: documentSnapshot['name'],
                      price: documentSnapshot['price'],
                      imageUrl: documentSnapshot['photo_url'],
                    );
                  },
                );
              }
              return SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()));
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15),
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => AddMenuBottomSheet(),
            );
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(350, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
          ),
          child: Text(
            'Tambah Menu',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.foodName,
    required this.price,
    required this.imageUrl,
    required this.id,
  });

  final String foodName;
  final int price;
  final String imageUrl;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/foodcard.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => FoodCardBottomSheet(
                foodName: foodName,
                price: price,
                imageUrl: imageUrl,
                foodId: id,
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  minRadius: 55,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(foodName),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Rp${price}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
