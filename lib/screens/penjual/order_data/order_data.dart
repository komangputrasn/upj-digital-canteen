import 'package:flutter/material.dart';

class OrderDataScreen extends StatefulWidget {
  const OrderDataScreen({super.key});

  @override
  State<OrderDataScreen> createState() => _OrderDataScreenState();
}

class _OrderDataScreenState extends State<OrderDataScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Pesanan',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.red.shade50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            OrderDataTabBar(tabController: tabController),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Center(
                    child: Text('Page 1'),
                  ),
                  Center(
                    child: Text('Page 2'),
                  ),
                  Center(
                    child: Text('Page 3'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderDataTabBar extends StatelessWidget {
  const OrderDataTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red.shade100,
      ),
      child: TabBar(
        unselectedLabelColor: Theme.of(context).primaryColor,
        indicator: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        tabs: [
          Tab(text: 'On progress'),
          Tab(text: 'History'),
          Tab(text: 'Cancel'),
        ],
        controller: tabController,
      ),
    );
  }
}
