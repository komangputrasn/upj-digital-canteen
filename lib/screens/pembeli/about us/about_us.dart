import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:upj_digital_canteen/constants.dart';

class AboutUsScreen extends StatefulWidget {
  AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final List<String> aboutUsImgPath = [
    'assets/about_us_img/nabiel.png',
    'assets/about_us_img/komang.png',
    'assets/about_us_img/fairo.png',
  ];

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'About Us',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Our Team',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CarouselSlider.builder(
              itemCount: aboutUsImgPath.length,
              itemBuilder: (context, index, realIndex) {
                return Image.asset(aboutUsImgPath[index]);
              },
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 0.75,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: 3,
                effect: ExpandingDotsEffect(dotHeight: 10, dotWidth: 10),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              child: Text(kWelcomePageAppDescription),
            )
          ],
        ),
      ),
    );
  }
}
