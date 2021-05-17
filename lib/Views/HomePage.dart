import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jivandaan/Config/colors.dart';
import 'package:jivandaan/Services/APIServices.dart';
import 'dart:html' as html;

import 'DashBoard.dart';
import 'constants.dart';
import 'getData.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final List<String> services = [
    "Oxygen",
    "Hospital with Beds",
    "Ambulance",
    "Medicines"
  ];

  final Map cases = {};

  @override
  void initState() {
    getData();
    super.initState();
    getDataCovid().then((value) {
      setState(() {
        activeCase = value['activeCases'].toString();
        totalCase = value['totalCases'].toString();
        recover = value['recovered'].toString();
        deaths = value['deaths'].toString();
        newActiveCase = value['activeCasesNew'].toString();
        newDeaths = value['deathsNew'].toString();
        newRecover = value['recoveredNew'].toString();
        perCentActive = ((int.parse(activeCase) / int.parse(totalCase)) * 100)
            .toStringAsPrecision(3);
        perCentDeaths = ((int.parse(deaths) / int.parse(totalCase)) * 100)
            .toStringAsPrecision(3);
        perCentRecovered = ((int.parse(recover) / int.parse(totalCase)) * 100)
            .toStringAsPrecision(3);
        chartData = [
          ChartData1(
              title: 'TotalCase',
              x: int.parse(totalCase),
              clr: Color(0xFF6E7191)),
          ChartData1(
              title: 'ActiveCases',
              x: int.parse(activeCase),
              clr: Color(0xFF0066FF)),
          ChartData1(
              title: 'Recovered',
              x: int.parse(recover),
              clr: Color(0xFF05E945)),
          ChartData1(
              title: 'Deaths', x: int.parse(deaths), clr: Color(0xFFFF0000)),
        ];
      });
    });
    getVacData().then((value) {
      setState(() {
        vacData = value.toString();
      });
    });
  }

  getData() async {
    cases.addAll(await APIServices().getTotalCases());
    setState(() {});
    print(cases);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: CustomColor.baseColor,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    'jivaandanlogo.png',
                    height: 35,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Jivandan",
              style: GoogleFonts.poppins(
                fontSize: 16.5,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => html.window.open(
                    "https://github.com/orgs/jivaandaan/dashboard", "new tab"),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.github,
                      size: 18,
                      color: Color(0xffAD87FF),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Github",
                      style: GoogleFonts.poppins(
                        fontSize: 15.5,
                        // fontWeight: FontWeight.w500,
                        color: CustomColor.textColor,

                        // color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => html.window.open(
                    "https://docs.google.com/spreadsheets/d/12-0vEXzVTdVEi85snlFNoElym8hRW3ABvrbgxN0VjV8/edit#gid=0",
                    "new tab"),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.heart_fill,
                      size: 17,
                      color: Color(0xffAD87FF),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Donate",
                      style: GoogleFonts.poppins(
                        fontSize: 15.5,
                        // fontWeight: FontWeight.w500,
                        color: CustomColor.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => html.window.open(
                    "https://docs.google.com/forms/d/e/1FAIpQLScySCYUPZG5lezcdefsUwV_bdNMC50S1v6wi3G7jKGOiA2DDA/viewform",
                    "new tab"),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.users,
                      size: 18,
                      color: Color(0xffAD87FF),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Contribute",
                      style: GoogleFonts.poppins(
                        fontSize: 15.5,
                        // fontWeight: FontWeight.w500,
                        color: CustomColor.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: DashBoard(),
    );
  }
}
