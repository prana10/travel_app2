import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/models/model_content.dart';
import 'package:real_estate/pages/detail_page.dart';

class GridviewContent extends StatelessWidget {
  GridviewContent({
    Key? key,
  }) : super(key: key);
  final varModel = Model.getModel();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Popular Destionation",
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 20),
        StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: varModel.length,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return DetailPage(
                      detailPagemodel: varModel[index],
                    );
                  }),
                );
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 5,
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(varModel[index].images),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10,
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                          ),
                          width: 170,
                          height: 70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                varModel[index].title,
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 7),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/location.png",
                                    width: 8,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    varModel[index].location,
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 7),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/star1.png",
                                    width: 9,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    varModel[index].rating,
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    varModel[index].review,
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          staggeredTileBuilder: (int index) => StaggeredTile.count(
            1,
            index.isEven ? 1.3 : 1.6,
          ),
        ),
      ],
    );
  }
}
