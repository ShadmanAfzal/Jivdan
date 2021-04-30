import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jivandaan/Config/colors.dart';

import '../Services.dart';
import 'Details.dart';

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
    'Chandigarh',
    'Chhattisgarh',
    'Delhi NCR',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Verified Crowd Sourced Emergency Services Directory and more info about the project or how to use",
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  searchBar(context) {
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
              Navigator.of(context).push(PageRouteBuilder(
                transitionDuration: Duration(seconds: 0),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ServicesScreen(
                  service: service,
                  state: searchController.text,
                ),
              ));
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

  card(context) {
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
                    Navigator.of(context).push(PageRouteBuilder(
                      transitionDuration: Duration(seconds: 0),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Details(
                        service: service,
                        state: city,
                      ),
                    ));
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
}
