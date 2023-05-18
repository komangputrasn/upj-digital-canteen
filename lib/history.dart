import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/homescreen.dart';
import 'constants.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 0,
            expandedHeight: screenHeight * 0.17,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: TabContainer(tabController: _tabController),
            ),
            backgroundColor: Colors.red.shade50,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              color: Color(kThemeColor),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                HistoryTab(),
                OngoingTab(),
              ],
            ),
          )
        ],
      ),
      // _elements.c
    );
  }
}

class HistoryTab extends StatelessWidget {
  const HistoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, idx) => HistoryTabCard(),
      ),
    );
  }
}

class HistoryTabCard extends StatelessWidget {
  const HistoryTabCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color.fromARGB(81, 205, 4, 48),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 6,
                      color: Color(kThemeColor),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kedai Gua',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text('12-12-2002'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nama Pesanan',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Jumlah',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nasi goreng',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Es jeruk',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Rp30.000',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OngoingTab extends StatelessWidget {
  const OngoingTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (ctx, idx) =>
          (idx == 0) ? OngoingTabMessage() : OngoingTabCard(),
    );
  }
}

class OngoingTabCard extends StatelessWidget {
  const OngoingTabCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color.fromARGB(81, 205, 4, 48),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 6,
                      color: Color(kThemeColor),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kedai Gua',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nama Pesanan',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Jumlah',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nasi goreng',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Es jeruk',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'On process',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabContainer extends StatelessWidget {
  const TabContainer({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(
            25.0,
          ),
        ),
        child: TabBar(
          controller: _tabController,
          // give the indicator a decoration (color and border radius)
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            color: Color(kThemeColor),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs: [
            // first tab [you can add an icon using the icon property]
            Tab(
              text: 'History',
            ),

            // second tab [you can add an icon using the icon property]
            Tab(
              text: 'Ongoing',
            ),
          ],
        ),
      ),
    );
  }
}

class OngoingTabMessage extends StatelessWidget {
  const OngoingTabMessage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Text(
        'Jangan lupa untuk membayar saat mengambil pesanan ya!',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
