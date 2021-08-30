import 'package:flutter/material.dart';
import 'package:real_estate/theme.dart';

class BottomNavbarCustom extends StatefulWidget {
  const BottomNavbarCustom({
    Key? key,
  }) : super(key: key);

  @override
  _BottomNavbarCustomState createState() => _BottomNavbarCustomState();
}

class _BottomNavbarCustomState extends State<BottomNavbarCustom> {
  int selectedIndex = 0;
  List<String> bottomnavbar = [
    "assets/home.png",
    "assets/location.png",
    "assets/cart.png",
    "assets/person.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(),
      width: MediaQuery.of(context).size.width,
      height: 67,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          itemBottomBar(0),
          SizedBox(width: 80),
          itemBottomBar(1),
          SizedBox(width: 80),
          itemBottomBar(2),
          SizedBox(width: 80),
          itemBottomBar(3),
        ],
      ),
    );
  }

  Widget itemBottomBar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            bottomnavbar[index],
            width: 20,
            color: selectedIndex == index ? selectedColor : unselectedColor,
          ),
          SizedBox(height: 3),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: selectedIndex == index ? Color(0xff0019FD) : transparan,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
