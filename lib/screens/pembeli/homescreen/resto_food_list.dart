import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upj_digital_canteen/constants.dart';
import 'package:upj_digital_canteen/models.dart';
import 'package:upj_digital_canteen/states.dart';
import 'package:upj_digital_canteen/temp_db.dart';

class RestoFoodList extends StatefulWidget {
  const RestoFoodList({
    super.key,
  });

  @override
  State<RestoFoodList> createState() => _RestoFoodListState();
}

class _RestoFoodListState extends State<RestoFoodList> {
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
                    FoodApi.restoName[restoIndex],
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
                            foodName: FoodApi.restoData[restoIndex][foodIndex]
                                [0],
                            price: int.parse(
                                FoodApi.restoData[restoIndex][foodIndex][1]),
                            imageUrl: FoodApi.foodImgPath[restoIndex]
                                [foodIndex],
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
    var selectedFoodProvider =
        Provider.of<SelectedFoodsProvider>(context, listen: false);
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
            !selectedFoodProvider.contains(widget.foodName)
                ? ElevatedButton(
                    onPressed: () {
                      selectedFoodProvider.addOrder(
                        FoodModel(
                          widget.foodName,
                          widget.price,
                          widget.imageUrl,
                        ),
                      );
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          buttonText,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    // child: Text(buttonText),
                  )
                : TextButton(
                    onPressed: () {
                      selectedFoodProvider.removeOrderByName(widget.foodName);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  '${widget.foodName} is removed from the cart'),
                            ],
                          ),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size(350, 40),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          'Remove from cart',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
