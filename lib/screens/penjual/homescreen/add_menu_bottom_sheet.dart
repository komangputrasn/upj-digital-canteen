import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:upj_digital_canteen/firestore.dart';

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
