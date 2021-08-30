import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/models/model_content.dart';
import 'dart:ui';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.detailPagemodel,
  }) : super(key: key);
  final Model detailPagemodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            background(),
            appbar(context),
            Content(contentModel: detailPagemodel),
            saved(),
          ],
        ),
      ),
    );
  }

  //background images
  Widget background() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(detailPagemodel.images),
          ),
        ),
      ),
    );
  }

  //appbar for arrow back
  Widget appbar(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Image.asset(
                        "assets/arrow_back.png",
                        // width: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //floating saved
  Widget saved() {
    return Positioned(
      top: 245,
      right: 14,
      child: Container(
        padding: EdgeInsets.all(17),
        width: 63,
        height: 63,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
        child: Image.asset(
          "assets/saved.png",
        ),
      ),
    );
  }
}

//content class
class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.contentModel,
  }) : super(key: key);
  final Model contentModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(
          left: 25,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              header(),
              SizedBox(height: 40),
              description(),
              SizedBox(height: 30),
              gallery(),
              SizedBox(height: 47),
              button(context),
            ],
          ),
        ),
      ),
    );
  }

  //header = title, location, rating
  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contentModel.title,
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Image.asset(
              "assets/location.png",
              width: 19,
            ),
            SizedBox(width: 16),
            Text(
              contentModel.location2,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Image.asset(
              "assets/star1.png",
              width: 19,
            ),
            SizedBox(width: 6),
            Image.asset(
              "assets/star1.png",
              width: 19,
            ),
            SizedBox(width: 6),
            Image.asset(
              "assets/star1.png",
              width: 19,
            ),
            SizedBox(width: 6),
            Image.asset(
              "assets/star1.png",
              width: 19,
            ),
            SizedBox(width: 6),
            Image.asset(
              "assets/star2.png",
              width: 19,
            ),
            SizedBox(width: 10),
            Text(
              contentModel.rating,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  //desc
  Widget description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Mount Bromo (Indonesian and Javanese: Gunung Bromo) is an active somma volcano and part of the Tengger mountains, in East Java, Indonesia.",
          textAlign: TextAlign.left,
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget gallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gallery",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Row(
            children: [
              Image.asset(
                "assets/gallery1.png",
                width: 74,
              ),
              SizedBox(width: 22),
              Image.asset(
                "assets/gallery2.png",
                width: 74,
              ),
              SizedBox(width: 22),
              Image.asset(
                "assets/gallery3.png",
                width: 74,
              ),
              SizedBox(width: 22),
              Stack(
                children: [
                  Image.asset(
                    "assets/gallery4.png",
                    width: 74,
                  ),
                  Positioned(
                    top: 20,
                    left: 18,
                    child: Text(
                      "12+",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  //button
  Widget button(context) {
    return Row(
      children: [
        Text(
          "\$100",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "/Day",
          style: GoogleFonts.inter(
            color: Colors.black.withOpacity(0.6),
            fontSize: 22,
          ),
        ),
        Spacer(),
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xff0019FD),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              "Book Now",
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
