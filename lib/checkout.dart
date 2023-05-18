import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upj_digital_canteen/homescreen.dart';
import 'package:upj_digital_canteen/models.dart';
import 'constants.dart';
import 'states.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    var orders = [];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(kThemeColor),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            pinned: true,
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      children: [
                        Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(kThemeColor),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Row(
                          children: [
                            Icon(Icons.school),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Universitas Pembangunan Jaya',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Daftar Pesanan',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          (orders.isEmpty)
              ? SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'Anda belum memesan makanan!',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: orders.length,
                    (context, index) => OrderCards(
                      model: orders[index],
                      index: index,
                    ),
                  ),
                ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15),
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ProceedPaymentBottomSheet(),
            );
          },
          child: Text(
            'Lanjut',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ProceedPaymentBottomSheet extends StatelessWidget {
  const ProceedPaymentBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  'Rp30.000',
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
                  'Rp30.000',
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
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(kThemeColor),
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
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCards extends StatefulWidget {
  const OrderCards({super.key, required this.model, required this.index});

  final OrderModel model;
  final int index;

  @override
  State<OrderCards> createState() => _OrderCardsState();
}

class _OrderCardsState extends State<OrderCards> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 15),
      child: Dismissible(
        onDismissed: (_) {
          print('this widget is removed');
          Provider.of<SelectedFoodsProvider>(context, listen: false)
              .removeOrder(widget.model);
        },
        key: Key(widget.index.toString()),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color.fromARGB(81, 205, 4, 48),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(kThemeColor),
                  backgroundImage: NetworkImage(widget.model.getImageUrl),
                  minRadius: 35,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.getName,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(widget.model.getHarga),
                    SizedBox(
                      height: 10,
                    ),
                    CartStepperInt(
                      value: _counter,
                      axis: Axis.horizontal,
                      didChangeCount: (count) {
                        setState(() {
                          _counter = count;

                          if (count == 0) {
                            Provider.of<SelectedFoodsProvider>(context,
                                    listen: false)
                                .removeOrder(widget.model);
                          }
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
