
import 'package:flutter/material.dart';
import 'package:upj_digital_canteen/constants.dart';

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
