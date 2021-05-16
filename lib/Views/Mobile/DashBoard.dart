import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jivandaan/Config/colors.dart';
import 'package:jivandaan/CovidDataDashboard/constants.dart';
import 'package:jivandaan/CovidDataDashboard/getData.dart';
import 'package:jivandaan/CovidDataDashboard/uiForMobile.dart';
import 'package:jivandaan/Services/APIServices.dart';
import 'package:velocity_x/velocity_x.dart';

class DashBoardMobile extends StatefulWidget {
  @override
  _DashBoardMobileState createState() => _DashBoardMobileState();
}

class _DashBoardMobileState extends State<DashBoardMobile> {
  List<bool> isSelected = [true, false, false, false];
  bool isloading = false;
  List<String> majorCities = [
    'Pan India',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Delhi NCR',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Ladakh',
    'Kerala',
    'Maharashtra',
    'Punjab',
    'Rajasthan',
    'Tamil Nadu',
    'Telangana',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];
  final TextEditingController searchController = TextEditingController();

  final Map cases = {};

  @override
  void initState() {
    getData();
    super.initState();
    getVacData().then((value) {
      setState(() {
        vacData = value.toString();
      });
    }
    );

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
        title: Text(
          "Jivandan",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),
        backgroundColor: CustomColor.baseColor,
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffEFF0F6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'jivaandanlogo.png',
                        width: 40,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "JivanDan",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.textColor,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "A small initiative to provide a helping hand in these difficult times.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 15, color: CustomColor.textColor),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MouseRegion(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected[0] = true;
                                  isSelected[1] = false;
                                  isSelected[2] = false;
                                  isSelected[3] = false;
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 100,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Oxygen",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: !isSelected[0]
                                              ? Color(0xff6E7191)
                                              : Color(0xffF7F7FC),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: !isSelected[0]
                                        ? Color(0xffEFF0F6)
                                        : Color(0xffAD87FF),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          MouseRegion(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected[1] = true;
                                  isSelected[0] = false;
                                  isSelected[2] = false;
                                  isSelected[3] = false;
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 120,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Hospital Beds",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: !isSelected[1]
                                              ? Color(0xff6E7191)
                                              : Color(0xffF7F7FC),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: !isSelected[1]
                                        ? Color(0xffEFF0F6)
                                        : Color(0xffAD87FF),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          MouseRegion(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected[2] = true;
                                  isSelected[1] = false;
                                  isSelected[0] = false;
                                  isSelected[3] = false;
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 100,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Medicine",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: !isSelected[2]
                                              ? Color(0xff6E7191)
                                              : Color(0xffF7F7FC),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: !isSelected[2]
                                        ? Color(0xffEFF0F6)
                                        : Color(0xffAD87FF),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          MouseRegion(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected[3] = true;
                                  isSelected[1] = false;
                                  isSelected[0] = false;
                                  isSelected[2] = false;
                                });
                                print("delete");
                              },
                              child: Container(
                                height: 35,
                                width: 110,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Ambulance",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: !isSelected[3]
                                              ? Color(0xff6E7191)
                                              : Color(0xffF7F7FC),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: !isSelected[3]
                                        ? Color(0xffEFF0F6)
                                        : Color(0xffAD87FF),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                searchBar(context),
                SizedBox(
                  height: 10,
                ),
                card(context),
               //activeCases(context, data)
               webMobileUI(context),
                SizedBox(
                  height: 30,
                ),
                Container(
                  color: Color(0xffEFF0F6),
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: Center(
                    child: Text(
                      "DSC Adgitm",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.textColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  searchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: Column(
        children: [
          TextField(
            controller: searchController,
            cursorColor: Colors.black,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: "Search for availablity in your state",
              hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
              ),
              isDense: true,
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.black,
              ),
              filled: true,
              fillColor: Color(0xffEFF0F8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () async {
              print(isSelected);
              int index = 0;
              String service = "";
              for (int i = 0; i < isSelected.length; i++) {
                if (isSelected[i] == true) {
                  index = i;
                  break;
                }
              }
              print(index);
              if (index == 0) {
                service = "oxygen";
              }
              if (index == 1) {
                service = "hospital";
              }
              if (index == 2) {
                service = "medicine";
              }
              if (index == 3) {
                service = "ambulance";
              }
              print(service);
              context.vxNav.push(
                Uri(
                  path: '/search',
                  queryParameters: {
                    "state": searchController.text.trim(),
                    "service": service
                  },
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            child: Container(
              height: 40,
              // width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Color(0xffAD87FF),
              ),
              child: Center(
                child: !isloading
                    ? Text(
                        "Search",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Color(0xffF7F7FC),
                        ),
                      )
                    : SizedBox(
                        width: 17,
                        height: 17,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 2,
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  card(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        color: Color(0xffEFF0F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        child: Container(
          width: MediaQuery.of(context).size.width - 10,
          child: GridView.count(
            shrinkWrap: true,
            childAspectRatio: 2,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            children: [
              for (String city in majorCities)
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    print(isSelected);
                    int index = 0;
                    String service = "";
                    for (int i = 0; i < isSelected.length; i++) {
                      if (isSelected[i] == true) {
                        index = i;
                        break;
                      }
                    }
                    print(index);
                    if (index == 0) {
                      service = "oxygen";
                    }
                    if (index == 1) {
                      service = "hospital";
                    }
                    if (index == 2) {
                      service = "medicine";
                    }
                    if (index == 3) {
                      service = "ambulance";
                    }
                    context.vxNav.push(
                      Uri(
                        path: '/search',
                        queryParameters: {"state": city, "service": service},
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      city,
                      style: GoogleFonts.poppins(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500,
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

  Widget activeCases(context, Map data) {
    return data.isNotEmpty
        ? Column(
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
                width: MediaQuery.of(context).size.width - 20,
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
                      childAspectRatio: 1.3,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
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
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Total Cases",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: CustomColor.textColor,
                                        ),
                                      ),
                                      // Icon(
                                      //   Icons.arrow_drop_up,
                                      //   size: 18,
                                      //   color: Colors.red.shade700,
                                      // ),
                                      // Text(
                                      //   "+ 9.8 % ",
                                      //   style: TextStyle(
                                      //     fontSize: 12.5,
                                      //     color: Colors.red.shade700,
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'HI', decimalDigits: 0)
                                        .format(data['confirmed'])
                                        .replaceAll("INR", ""),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.workSans(
                                      fontSize: 18,
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
                                  //     fontSize: 16,
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
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Active Cases",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: CustomColor.textColor,
                                        ),
                                      ),
                                      // Icon(
                                      //   Icons.arrow_drop_up,
                                      //   size: 18,
                                      //   color: Colors.red.shade700,
                                      // ),
                                      // Text(
                                      //   "+ 9.8 % ",
                                      //   style: TextStyle(
                                      //     fontSize: 12.5,
                                      //     color: Colors.red.shade700,
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
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
                                      fontSize: 18,
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
                                  //     fontSize: 16,
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
                                    height: 30,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Recovered",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
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
                                    height: 10,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'HI', decimalDigits: 0)
                                        .format(data['recovered'])
                                        .replaceAll("INR", ""),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.workSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green.shade700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
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
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Deceased",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
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
                                    height: 10,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'HI', decimalDigits: 0)
                                        .format(data['deaths'])
                                        .replaceAll("INR", ""),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.workSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: CustomColor.textColor,
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
          )
        : Container();
  }
}
