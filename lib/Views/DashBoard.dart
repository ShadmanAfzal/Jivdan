import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jivandaan/Config/colors.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffEFF0F6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'blood-donation.svg',
                        width: 55,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "JivanDan",
                    style: GoogleFonts.poppins(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.textColor,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 400),
                    child: Text(
                      "Verified Crowd Sourced Emergency Services Directory and more info about the project or how to use",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: CustomColor.textColor),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 100,
                        child: Center(
                          child: Text(
                            "Oxygen",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff6E7191),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffEFF0F6),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 35,
                        width: 120,
                        child: Center(
                          child: Text(
                            "Hospital Beds",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff6E7191),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffEFF0F6),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 35,
                        width: 100,
                        child: Center(
                          child: Text(
                            "Medicine",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff6E7191),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffEFF0F6),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 35,
                        width: 100,
                        child: Center(
                          child: Text(
                            "Ambulance",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                              // color: Color(0xff6E7191),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffAD87FF),
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
