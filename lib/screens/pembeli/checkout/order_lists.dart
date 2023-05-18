import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upj_digital_canteen/constants.dart';
import 'package:upj_digital_canteen/models.dart';
import 'package:upj_digital_canteen/states.dart';

class NoOrdersContainer extends StatelessWidget {
  const NoOrdersContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Image.asset('assets/ilus/empty_cart.png'),
      ),
    );
  }
}

class OrderListsView extends StatelessWidget {
  const OrderListsView({
    super.key,
    required this.orders,
  });

  final List orders;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: orders.length,
        (context, index) => OrderCards(
          model: orders[index],
          index: index,
        ),
      ),
    );
  }
}

class OrderCards extends StatefulWidget {
  const OrderCards({super.key, required this.model, required this.index});

  final FoodModel model;
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
