import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/firestore.dart';

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

class FoodCardBottomSheet extends StatefulWidget {
  FoodCardBottomSheet({
    super.key,
    required this.foodName,
    required this.price,
    required this.foodId,
    required this.imageUrl,
  });

  final String foodName;
  final int price;
  final String foodId;
  final String imageUrl;

  @override
  State<FoodCardBottomSheet> createState() => _FoodCardBottomSheetState();
}

class _FoodCardBottomSheetState extends State<FoodCardBottomSheet> {
  TextEditingController foodNameTextEditingController = TextEditingController();
  TextEditingController priceTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    foodNameTextEditingController.text = widget.foodName;
    priceTextEditingController.text = widget.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit menu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: foodNameTextEditingController,
                decoration: InputDecoration(
                  labelText: 'Nama makanan',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: priceTextEditingController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Harga',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imageUrl),
                    backgroundColor: Colors.pink,
                    maxRadius: 35,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Pick image'),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    MerchantData().updateFood(widget.foodId, {
                      'name': foodNameTextEditingController.text,
                      'price': int.parse(priceTextEditingController.text),
                    });
                    Navigator.of(context).pop();
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
                    'Simpan menu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    MerchantData().deleteFood(widget.foodId);
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(350, 40),
                  ),
                  child: Text(
                    'Hapus menu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
