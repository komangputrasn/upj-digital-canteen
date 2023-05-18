import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:upj_digital_canteen/checkout.dart';
import 'package:upj_digital_canteen/history.dart';
import 'package:upj_digital_canteen/login.dart';
import 'package:upj_digital_canteen/models.dart';
import 'package:upj_digital_canteen/notifications.dart';
import 'package:upj_digital_canteen/profile.dart';
import 'states.dart';
import 'constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerView(),
      ),
      backgroundColor: Colors.red.shade50,
      body: CustomScrollView(
        slivers: [
          HomeAppBar(),
          SearchBar(),
          AdvertCarousel(),
          PickUp(),
          RestoFoodList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(kThemeColor),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Checkout(),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class DrawerView extends StatelessWidget {
  const DrawerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/upj_logo.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'UPJ Digital Canteen',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          DrawerMenu(
            icon: Icon(Icons.history),
            menuName: 'History',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => History(),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          DrawerMenu(
            icon: Icon(Icons.person),
            menuName: 'Profile',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          DrawerMenu(
            icon: Icon(Icons.logout),
            menuName: 'Log out',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          DrawerMenu(
            icon: Icon(Icons.info),
            menuName: 'About us',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
    required this.icon,
    required this.menuName,
    this.onTap,
  });

  final Icon icon;
  final String menuName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 300,
          height: 50,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                icon,
                SizedBox(
                  width: 20,
                ),
                Text(
                  menuName,
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RestoFoodList extends StatefulWidget {
  const RestoFoodList({
    super.key,
  });

  @override
  State<RestoFoodList> createState() => _RestoFoodListState();
}

class _RestoFoodListState extends State<RestoFoodList> {
  List<OrderModel> orderList = [];

  final List<String> restoName = ['Kedai Gua', 'Warung Bali', 'Dapur Tante'];

  final List<List<String>> foodImgPath = [
    [
      'https://upload.wikimedia.org/wikipedia/commons/2/24/Ayam_geprek.png',
      'https://aromarasa.com/wp-content/uploads/2021/07/resep-kentang-goreng-crispy-ala-mcd-sederhana.jpg',
      'https://cbtl-images.s3.us-west-1.amazonaws.com/Production/Drupal/s3fs-public/styles/cafe_menu_item/public/cafe-menu/Mango%20Ice%20Blended%20drink.jpg?itok=w5Y1qx6A'
    ],
    [
      'https://cdn-2.tstatic.net/kaltim/foto/bank/images/resep-ayam-bakar-tulang-lunak-enak.jpg',
      'https://img.okezone.com/content/2022/07/13/298/2628977/kalori-nasi-uduk-menu-sarapan-favorit-orang-indonesia-bikin-gemuk-YUzqTbTieA.jpeg',
      'https://static.sehatq.com/content/review/image/1661766520.jpeg',
    ],
    [
      'https://asset.kompas.com/crops/AOxjgbVCl_OySCVMPBlH0FaBMWI=/106x50:906x583/780x390/data/photo/2022/06/04/629ac9495413f.jpg',
      'https://img-global.cpcdn.com/recipes/0708ba41c3f11703/1200x630cq70/photo.jpg',
      'https://sgp1.digitaloceanspaces.com/tz-mag-id/wp-content/uploads/2020/09/121209091717/4-Batagor-Ihsan.jpg',
    ]
  ];

  final List<List<List<String>>> restoData = [
    [
      ['Ayam Geprek', '12000'],
      ['Kentang Goreng', '10000'],
      ['Mango Ice Blend', '12000']
    ],
    [
      ['Ayam Bakar', '15000'],
      ['Nasi Uduk', '12000'],
      ['Ayam Goreng', '13000']
    ],
    [
      ['Chicken Katsu', '12000'],
      ['Roti Bakar', '10000'],
      ['Batagor', '10000']
    ]
  ];

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
                    restoName[restoIndex],
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
                            foodName: restoData[restoIndex][foodIndex][0],
                            price: 'Rp${restoData[restoIndex][foodIndex][1]}',
                            imageUrl: foodImgPath[restoIndex][foodIndex],
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
  final String price;
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
            Provider.of<SelectedFoodsProvider>(context, listen: false).addOrder(
              OrderModel(
                foodName,
                price,
                imageUrl,
              ),
            );
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
                    Text(price),
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

class FoodCardModalBottomSheet extends StatelessWidget {
  const FoodCardModalBottomSheet({
    super.key,
    required this.imageUrl,
    required this.foodName,
    required this.price,
  });

  final String imageUrl;
  final String foodName;
  final String price;

  @override
  Widget build(BuildContext context) {
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
                  backgroundImage: NetworkImage(imageUrl),
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
                      foodName,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {
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
                        Text('$foodName is added to the cart'),
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
              child: Text('Add to cart'),
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

class PickUp extends StatelessWidget {
  const PickUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih makanan favorit Anda!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: ElevatedButton(
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
                  'Pick up',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AdvertCarousel extends StatefulWidget {
  const AdvertCarousel({
    super.key,
  });

  @override
  State<AdvertCarousel> createState() => _AdvertCarouselState();
}

class _AdvertCarouselState extends State<AdvertCarousel> {
  int currentIndex = 0;
  List<String> bannerAssetsDir = [
    'assets/pizza_banner.png',
    'assets/ramen_banner.png',
    'assets/tteokbokki_banner.png'
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) => Container(
                width: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(bannerAssetsDir[index]))
                    // image: DecorationImage(
                    //   image: NetworkImage(
                    //       'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                    // ),
                    ),
              ),
              options: CarouselOptions(
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(
              height: 12,
            ),
            AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: 3,
              effect: ExpandingDotsEffect(dotHeight: 10, dotWidth: 10),
            )
          ],
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(kThemeColor),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NotificationsPage(),
              ),
            );
          },
          icon: Icon(Icons.notifications_rounded),
        )
      ],
      title: Text(
        'Search for food',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      pinned: true,
      floating: true,
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Color(kThemeColor),
        child: Container(
          width: 200,
          height: 100,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: 500,
                  height: 50,
                  color: Color(kThemeColor),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Material(
                    elevation: 15,
                    child: SizedBox(
                      width: 370,
                      child: TextField(
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Pesan makanan'),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
