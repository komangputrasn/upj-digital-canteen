import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
