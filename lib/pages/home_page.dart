import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/models/model_tabbar.dart';
import 'package:real_estate/pages/components/bottom_navbar.dart';
import 'package:real_estate/pages/components/gridview_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbarCustom(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(height: 23),
              header(),
              SizedBox(height: 30),
              banner(),
              SizedBox(height: 30),
              tabbar(),
              SizedBox(height: 36),
              GridviewContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      children: [
        Image.asset(
          "assets/photo_profile.png",
          width: 40,
          height: 40,
        ),
        SizedBox(width: 16),
        Text(
          "Hai Prana",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        Image.asset(
          "assets/search.png",
          width: 20,
          height: 20,
        ),
        SizedBox(width: 20),
        Image.asset(
          "assets/notif.png",
          width: 20,
          height: 20,
        ),
      ],
    );
  }

  Widget banner() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/banner.png"),
        ),
      ),
    );
  }

  Widget tabbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            tabbarModel.length,
            (index) {
              return Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF3F3F3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Image.asset(
                        tabbarModel[index],
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    tabbarModelText[index],
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xfff979797),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
