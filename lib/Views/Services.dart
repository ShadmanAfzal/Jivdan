import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jivandaan/Config/colors.dart';
import 'package:jivandaan/Services/APIServices.dart';

import 'Mobile/Details.dart';

class ServicesScreen extends StatefulWidget {
  final String state;
  final String service;

  const ServicesScreen({Key key, this.state, this.service}) : super(key: key);
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  List<bool> isSelected = [true, false, false, false];
  List<bool> verified = [false, false, false];
  bool isloading = false;
  List data = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    try {
      setState(() {
        isloading = true;
      });
      data = await APIServices().getBeds(widget.service, widget.state);
      print(data);
    } catch (e) {
      print(e);
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, width) {
      if (width.maxWidth > 800) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 5,
            iconTheme: IconThemeData(
              color: CustomColor.textColor,
            ),
            backgroundColor: Color(0xffE5E5E5),
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    'jivaandanlogo.png',
                    height: 35,
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
                        color: CustomColor.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Center(
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
                        fontWeight: FontWeight.w500,
                        color: CustomColor.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Center(
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
                        fontWeight: FontWeight.w500,
                        color: CustomColor.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          body: Scrollbar(
            isAlwaysShown: true,
            // showT/rackOnHover: true,
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      widget.state,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.textColor,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        content(context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Details();
      }
    });
  }

  Widget selectServiceTab(context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
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
                  width: !isSelected[0] ? 100 : 120,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isSelected[0]
                            ? SvgPicture.asset(
                                'oxygen-cylinder.svg',
                                color: Colors.white,
                                width: 25,
                              )
                            : Container(),
                        SizedBox(
                          width: isSelected[0] ? 5 : 0,
                        ),
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
              cursor: SystemMouseCursors.click,
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
                  width: !isSelected[1] ? 120 : 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isSelected[1]
                            ? SvgPicture.asset(
                                'bed-hospital.svg',
                                color: Colors.white,
                                width: 25,
                              )
                            : Container(),
                        SizedBox(
                          width: isSelected[1] ? 5 : 0,
                        ),
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
              cursor: SystemMouseCursors.click,
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
                  width: !isSelected[2] ? 100 : 120,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isSelected[2]
                            ? SvgPicture.asset(
                                'drug.svg',
                                color: Colors.white,
                                width: 25,
                              )
                            : Container(),
                        SizedBox(
                          width: isSelected[2] ? 5 : 0,
                        ),
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
              cursor: SystemMouseCursors.click,
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
                  width: !isSelected[3] ? 110 : 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isSelected[3]
                            ? SvgPicture.asset(
                                'ambulance.svg',
                                color: Colors.white,
                                height: 30,
                              )
                            : Container(),
                        SizedBox(
                          width: isSelected[3] ? 5 : 0,
                        ),
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
                    color:
                        !isSelected[3] ? Color(0xffEFF0F6) : Color(0xffAD87FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget tags(context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Tags",
              style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.textColor),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              elevation: 0,
              onPressed: () {
                setState(() {
                  verified[0] = true;
                  verified[1] = false;
                  verified[2] = false;
                });
              },
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverElevation: 0,
              color: verified[0] ? Color(0xffC1FFC0) : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Container(
                width: 120,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_box_rounded,
                      color: CustomColor.textColor,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Verified",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  verified[1] = true;
                  verified[0] = false;
                  verified[2] = false;
                });
              },
              elevation: 0,
              hoverElevation: 0,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              color: verified[1] ? Color(0xffC1FFC0) : Colors.transparent,

              // color: Color(0xffC1FFC0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Container(
                width: 120,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.phone_fill_badge_plus,
                      color: CustomColor.textColor,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Not Available",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  verified[2] = true;
                  verified[1] = false;
                  verified[0] = false;
                });
              },
              elevation: 0,
              hoverColor: Colors.transparent,
              hoverElevation: 0,
              focusColor: Colors.transparent,
              color: verified[2] ? Color(0xffC1FFC0) : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Container(
                width: 120,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cancel_rounded,
                      color: CustomColor.textColor,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Not Verified",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget content(context) {
    return !isloading
        ? data.isNotEmpty
            ? Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Color(0xffEFF0F7),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(6),
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Container(
                              // height: 150,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]['name'] ?? "None",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColor.textColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${data[index]['city'] ?? ""} | ${data[index]['state'] ?? widget.state}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: CustomColor.textColor,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.phone_fill,
                                              size: 20,
                                              color: CustomColor.textColor,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              data[index]['phone'].toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                color: CustomColor.textColor,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Details",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: CustomColor.textColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Flexible(
                                          child: Text(
                                            "${data[index]['details'] ?? "None"}",
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              // fontWeight: FontWeight.w500,
                                              color: CustomColor.textColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Last Verified",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: CustomColor.textColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Flexible(
                                          child: Text(
                                            "${data[index]['last_verified_at'] != null ? DateFormat("hh:mm a dd MMM yy").format(DateTime.parse(data[index]['last_verified_at'])) : "None"}",
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              // fontWeight: FontWeight.w500,
                                              color: CustomColor.textColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Last Updated",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: CustomColor.textColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Flexible(
                                          child: Text(
                                            "${DateFormat("hh:mm a dd MMM yy").format(DateTime.parse(data[index]['updated_at']))}",
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              // fontWeight: FontWeight.w500,
                                              color: CustomColor.textColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 130,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${data[index]['resource_type'].toString() != 'null' && data[index]['resource_type'].toString().length > 18 ? widget.service : data[index]['resource_type']}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 13.5,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffF7F7FC),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color(0xffAD87FF),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 110,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${data[index]['availability']}",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 13.5,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        CustomColor.textColor,
                                                    // color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color(0xffC1FFC0),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              )
            : Container(
                height: 400,
                width: 700,
                child: Center(
                  child: Image.asset(
                    "result.webp",
                    width: 300,
                  ),
                ),
              )
        : Container(
            height: 400,
            width: 700,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
            ),
          );
  }
}
