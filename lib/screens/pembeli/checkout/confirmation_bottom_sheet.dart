import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upj_digital_canteen/states.dart';

class ProceedPaymentBottomSheet extends StatelessWidget {
  const ProceedPaymentBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var selectedFoodProvider =
        Provider.of<SelectedFoodsProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rincian',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Rp${selectedFoodProvider.getTotalCost()}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Pembayaran',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp${selectedFoodProvider.getTotalCost()}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Metode pembayaran',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Cash/Qris',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ConfirmationButton(),
          ],
        ),
      ),
    );
  }
}

class ConfirmationButton extends StatelessWidget {
  const ConfirmationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(400, 43),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
      child: Text(
        'Proses Pesanan',
        style: TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }
}
