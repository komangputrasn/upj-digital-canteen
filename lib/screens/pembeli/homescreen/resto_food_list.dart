import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upj_digital_canteen/constants.dart';
import 'package:upj_digital_canteen/models.dart';
import 'package:upj_digital_canteen/states.dart';

class RestoFoodList extends StatefulWidget {
  const RestoFoodList({
    super.key,
  });

  @override
  State<RestoFoodList> createState() => _RestoFoodListState();
}

class _RestoFoodListState extends State<RestoFoodList> {
  List<FoodModel> orderList = [];

  final List<String> restoName = ['Kedai Gua', 'Warung Bali', 'Dapur Tante'];

  final List<List<String>> foodImgPath = [
    [
      'https://upload.wikimedia.org/wikipedia/commons/2/24/Ayam_geprek.png',
      'https://aromarasa.com/wp-content/uploads/2021/07/resep-kentang-goreng-crispy-ala-mcd-sederhana.jpg',
      'https://cbtl-images.s3.us-west-1.amazonaws.com/Production/Drupal/s3fs-public/styles/cafe_menu_item/public/cafe-menu/Mango%20Ice%20Blended%20drink.jpg?itok=w5Y1qx6A'
    ],
    [
      'https://cdn-2.tstatic.net/kaltim/foto/bank/images/resep-ayam-bakar-tulang-lunak-enak.jpg',
      'https://img.okezone.com/content/2022/07/13/298/2628977/kalori-nasi-uduk-menu-sarapan-favorit-orang-indonesia-bikin-gemuk-YUzqTbTieA.jpeg',
      'https://static.sehatq.com/content/review/image/1661766520.jpeg',
    ],
    [
      'https://asset.kompas.com/crops/AOxjgbVCl_OySCVMPBlH0FaBMWI=/106x50:906x583/780x390/data/photo/2022/06/04/629ac9495413f.jpg',
      'https://img-global.cpcdn.com/recipes/0708ba41c3f11703/1200x630cq70/photo.jpg',
      'https://sgp1.digitaloceanspaces.com/tz-mag-id/wp-content/uploads/2020/09/121209091717/4-Batagor-Ihsan.jpg',
    ]
  ];

  final List<List<List<String>>> restoData = [
    [
      ['Ayam Geprek', '12000'],
      ['Kentang Goreng', '10000'],
      ['Mango Ice Blend', '12000']
    ],
    [
      ['Ayam Bakar', '15000'],
      ['Nasi Uduk', '12000'],
      ['Ayam Goreng', '13000']
    ],
    [
      ['Chicken Katsu', '12000'],
      ['Roti Bakar', '10000'],
      ['Batagor', '10000']
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int restoIndex) {
          return Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restoName[restoIndex],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, foodIndex) => Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: FoodCard(
                            foodName: restoData[restoIndex][foodIndex][0],
                            price:
                                int.parse(restoData[restoIndex][foodIndex][1]),
                            imageUrl: foodImgPath[restoIndex][foodIndex],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        childCount: 3,
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
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: 150,
      height: 200,
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
              context: context,
              builder: (context) => FoodCardModalBottomSheet(
                  imageUrl: imageUrl, foodName: foodName, price: price),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  backgroundColor: Color(kThemeColor),
                  minRadius: 55,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(foodName),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Rp${price.toString()}'),
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

class FoodCardModalBottomSheet extends StatefulWidget {
  const FoodCardModalBottomSheet({
    super.key,
    required this.imageUrl,
    required this.foodName,
    required this.price,
  });

  final String imageUrl;
  final String foodName;
  final int price;

  @override
  State<FoodCardModalBottomSheet> createState() =>
      _FoodCardModalBottomSheetState();
}

class _FoodCardModalBottomSheetState extends State<FoodCardModalBottomSheet> {
  String buttonText = 'Add to cart';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.imageUrl),
                  backgroundColor: Color(kThemeColor),
                  minRadius: 40,
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.foodName,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp${widget.price}',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<SelectedFoodsProvider>(context, listen: false)
                    .addOrder(FoodModel(
                        widget.foodName, widget.price, widget.imageUrl));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('${widget.foodName} is added to the cart'),
                      ],
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(350, 40),
                backgroundColor: Color(kThemeColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              child: Text(buttonText),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
