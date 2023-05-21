import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upj_digital_canteen/firestore.dart';
import 'package:upj_digital_canteen/screens/penjual/settings/settings_main.dart';
import 'dart:io';

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
                    id: documentSnapshot.id,
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

class AddMenuBottomSheet extends StatefulWidget {
  const AddMenuBottomSheet({super.key});

  @override
  State<AddMenuBottomSheet> createState() => _AddMenuBottomSheetState();
}

class _AddMenuBottomSheetState extends State<AddMenuBottomSheet> {
  File? image;

  Future getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage == null) {
      return;
    }

    final imageTemporary = File(pickedImage.path);

    setState(() {
      image = imageTemporary;
    });
  }

  Future uploadFileAndStoreInMerchantCollection() async {
    String fileName = image!.path.split(Platform.pathSeparator).last;
    final path = 'menu_photos/$fileName}';
    final ref = FirebaseStorage.instance.ref().child(path);
    final UploadTask uploadTask = ref.putFile(image!);

    final snapshot = await uploadTask.whenComplete(() {});
    final String urlDownload = await snapshot.ref.getDownloadURL();

    MerchantData().addNewFood(
      foodNameTextEditingController.text,
      int.parse(priceTextEditingController.text),
      urlDownload,
    );
  }

  final foodNameTextEditingController = TextEditingController();
  final priceTextEditingController = TextEditingController();

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
                'Tambah menu',
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
                    backgroundImage: image != null ? FileImage(image!) : null,
                    backgroundColor: Colors.pink,
                    maxRadius: 35,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: getImage,
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
                    if (foodNameTextEditingController.text.isEmpty ||
                        priceTextEditingController.text.isEmpty ||
                        image == null) {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          title: Text('Error'),
                          contentPadding: EdgeInsets.all(20),
                          children: [
                            Text('Please fill all forms (including image)'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                      return;
                    }

                    uploadFileAndStoreInMerchantCollection();
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
                    'Tambah Menu',
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
                    'Tambah Menu',
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
