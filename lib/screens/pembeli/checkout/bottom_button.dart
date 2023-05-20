import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/screens/pembeli/checkout/confirmation_bottom_sheet.dart';

class BottomNavBarButton extends StatelessWidget {
  const BottomNavBarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => ProceedPaymentBottomSheet(),
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
          'Lanjut',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
