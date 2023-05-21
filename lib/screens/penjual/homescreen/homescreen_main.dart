import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/firestore.dart';
import 'package:upj_digital_canteen/screens/penjual/settings/settings_main.dart';

class MerchantHomeScreen extends StatelessWidget {
  const MerchantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MerchantSettingsScreen(),
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.restaurant),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: StreamBuilder(
          stream: MerchantData().getFoodCollectionSnapshot(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
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
                    foodName: documentSnapshot['name'],
                    price: documentSnapshot['price'],
                    imageUrl: documentSnapshot['photo_url'],
                  );
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          },
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
  });

  final String foodName;
  final int price;
  final String imageUrl;

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
          onTap: () {},
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
