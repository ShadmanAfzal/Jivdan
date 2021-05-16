import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jivandaan/Config/colors.dart';
Widget activeCases(context, Map data) {
  return data.isNotEmpty
      ? LayoutBuilder(builder: (context, size) {
          double width = size.maxWidth;
          print(size.toString() + "+++");
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Covid-19 India",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: CustomColor.textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: !(width > 700 && width < 1200)
                    ? MediaQuery.of(context).size.width - 250
                    : MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffEFF0F6),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  child: Container(
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio:
                          (width > 700 && width < 1200) ? 1 : 1.05,
                      crossAxisCount: 4,
                      crossAxisSpacing:
                          !(width > 700 && width < 1200) ? 15 : 10,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          color: Colors.white,
                          child: Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Total Cases",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: CustomColor.textColor,
                                        ),
                                      ),
                                      // Icon(
                                      //   Icons.arrow_drop_up,
                                      //   size: 40,
                                      //   color: Colors.red.shade700,
                                      // ),
                                      // Text(
                                      //   "+ 9.8 % ",
                                      //   style: TextStyle(
                                      //     fontSize: 14,
                                      //     color: Colors.red.shade700,
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'HI', decimalDigits: 0)
                                        .format(data['confirmed'])
                                        .replaceAll("INR", ""),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.workSans(
                                      fontSize: !(width > 700 && width < 1200)
                                          ? 30
                                          : 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red.shade700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  // Text(
                                  //   "+ 275,414",
                                  //   textAlign: TextAlign.center,
                                  //   style: GoogleFonts.poppins(
                                  //     fontSize: 18,
                                  //     fontWeight: FontWeight.w500,
                                  //     color: Colors.red.shade700,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            height: 150,
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          color: Colors.white,
                          child: Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Active Cases",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: CustomColor.textColor,
                                        ),
                                      ),
                                      // Icon(
                                      //   Icons.arrow_drop_up,
                                      //   size: 40,
                                      //   color: Colors.red.shade700,
                                      // ),
                                      // Text(
                                      //   "+ 9.8 % ",
                                      //   style: TextStyle(
                                      //     fontSize: 14,
                                      //     color: Colors.red.shade700,
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'HI', decimalDigits: 0)
                                        .format((data['confirmed'] -
                                            data['deaths'] -
                                            data['recovered']))
                                        .replaceAll("INR", ""),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.workSans(
                                      fontSize: !(width > 700 && width < 1200)
                                          ? 30
                                          : 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue.shade700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  // Text(
                                  //   "+ 275,414",
                                  //   textAlign: TextAlign.center,
                                  //   style: GoogleFonts.poppins(
                                  //     fontSize: 18,
                                  //     fontWeight: FontWeight.w500,
                                  //     color: Colors.blue.shade700,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            height: 150,
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          color: Colors.white,
                          child: Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Recovered",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: CustomColor.textColor,
                                        ),
                                      ),
                                      // Icon(
                                      //   Icons.arrow_drop_up,
                                      //   size: 40,
                                      //   color: Colors.green.shade700,
                                      // ),
                                      // Text(
                                      //   "+ 9.8 % ",
                                      //   style: TextStyle(
                                      //     fontSize: 14,
                                      //     color: Colors.green.shade700,
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'HI', decimalDigits: 0)
                                        .format(data['recovered'])
                                        .replaceAll("INR", ""),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.workSans(
                                      fontSize: !(width > 700 && width < 1200)
                                          ? 30
                                          : 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green.shade700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  // SizedBox(
                                  //   height: 5,
                                  // ),
                                  // Text(
                                  //   "+ 275,414",
                                  //   textAlign: TextAlign.center,
                                  //   style: GoogleFonts.poppins(
                                  //     fontSize: 18,
                                  //     fontWeight: FontWeight.w500,
                                  //     color: Colors.green.shade700,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            height: 150,
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          color: Colors.white,
                          child: Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Deceased",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: CustomColor.textColor,
                                        ),
                                      ),
                                      // Icon(
                                      //   Icons.arrow_drop_up,
                                      //   size: 40,
                                      //   color: Colors.red.shade700,
                                      // ),
                                      // Text(
                                      //   "+ 9.8 % ",
                                      //   style: TextStyle(
                                      //     fontSize: 14,
                                      //     color: Colors.red.shade700,
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'HI', decimalDigits: 0)
                                        .format(data['deaths'])
                                        .replaceAll("INR", ""),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.workSans(
                                      fontSize: !(width > 700 && width < 1200)
                                          ? 30
                                          : 22,
                                      fontWeight: FontWeight.w600,
                                      color: CustomColor.textColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  // SizedBox(
                                  //   height: 5,
                                  // ),
                                  // Text(
                                  //   "+ 275,414",
                                  //   textAlign: TextAlign.center,
                                  //   style: GoogleFonts.poppins(
                                  //     fontSize: 18,
                                  //     fontWeight: FontWeight.w500,
                                  //     color: CustomColor.textColor,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        })
      : Container();
}
