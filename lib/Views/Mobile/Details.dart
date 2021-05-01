import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jivandaan/Config/colors.dart';
import 'package:jivandaan/Services/APIServices.dart';

class Details extends StatefulWidget {
  final String service;
  final String state;

  const Details({Key key, this.service, this.state}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<bool> isSelected = [true, false, false, false];
  List<bool> verified = [true, false, false];
  List verifiedList = [];
  List noVerified = [];
  List notavailable = [];
  List list = [];
  bool isloading = false;
  List data = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    print(widget.state);
    try {
      setState(() {
        isloading = true;
      });
      data = await APIServices().getBeds(widget.service, widget.state);
    } catch (e) {
      print(e);
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: CustomColor.textColor,
        ),
        elevation: 5,
        title: SelectableText(
          "Jivandan",
          toolbarOptions: ToolbarOptions(
              copy: true, selectAll: true, cut: false, paste: false),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                SelectableText(
                  widget.state ?? "",
                  toolbarOptions: ToolbarOptions(
                      copy: true, selectAll: true, cut: false, paste: false),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.textColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                content(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selectServiceTab(context) {
    return Container(
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
                          SelectableText(
                            "Oxygen",
                            toolbarOptions: ToolbarOptions(
                                copy: true,
                                selectAll: true,
                                cut: false,
                                paste: false),
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
                          SelectableText(
                            "Hospital Beds",
                            toolbarOptions: ToolbarOptions(
                                copy: true,
                                selectAll: true,
                                cut: false,
                                paste: false),
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
                          SelectableText(
                            "Medicine",
                            toolbarOptions: ToolbarOptions(
                                copy: true,
                                selectAll: true,
                                cut: false,
                                paste: false),
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
                  },
                  child: Container(
                    height: 35,
                    width: 110,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText(
                            "Ambulance",
                            toolbarOptions: ToolbarOptions(
                                copy: true,
                                selectAll: true,
                                cut: false,
                                paste: false),
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
    );
  }

  // Widget tags(context) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width / 4,
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           SelectableText(
  //             "Tags",
  //             style: GoogleFonts.poppins(
  //                 fontSize: 22,
  //                 fontWeight: FontWeight.w600,
  //                 color: CustomColor.textColor),
  //           ),
  //           SizedBox(
  //             height: 15,
  //           ),
  //           MaterialButton(
  //             elevation: 0,
  //             onPressed: () {
  //               setState(() {
  //                 verified[0] = true;
  //                 verified[1] = false;
  //                 verified[2] = false;
  //               });
  //             },
  //             hoverColor: Colors.transparent,
  //             focusColor: Colors.transparent,
  //             hoverElevation: 0,
  //             color: verified[0] ? Color(0xffC1FFC0) : Colors.transparent,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(40),
  //             ),
  //             child: Container(
  //               width: 120,
  //               height: 40,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Icon(
  //                     Icons.check_box_rounded,
  //                     color: CustomColor.textColor,
  //                     size: 18,
  //                   ),
  //                   SizedBox(width: 5),
  //                   SelectableText(
  //                     "Verified",
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.w600,
  //                       color: CustomColor.textColor,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 15,
  //           ),
  //           MaterialButton(
  //             onPressed: () {
  //               setState(() {
  //                 verified[1] = true;
  //                 verified[0] = false;
  //                 verified[2] = false;
  //               });
  //             },
  //             elevation: 0,
  //             hoverElevation: 0,
  //             hoverColor: Colors.transparent,
  //             focusColor: Colors.transparent,
  //             color: verified[1] ? Color(0xffC1FFC0) : Colors.transparent,

  //             // color: Color(0xffC1FFC0),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(40),
  //             ),
  //             child: Container(
  //               width: 120,
  //               height: 40,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Icon(
  //                     CupertinoIcons.phone_fill_badge_plus,
  //                     color: CustomColor.textColor,
  //                     size: 18,
  //                   ),
  //                   SizedBox(width: 5),
  //                   SelectableText(
  //                     "Not Available",
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.w600,
  //                       color: CustomColor.textColor,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 15,
  //           ),
  //           MaterialButton(
  //             onPressed: () {
  //               setState(() {
  //                 verified[2] = true;
  //                 verified[1] = false;
  //                 verified[0] = false;
  //               });
  //             },
  //             elevation: 0,
  //             hoverColor: Colors.transparent,
  //             hoverElevation: 0,
  //             focusColor: Colors.transparent,
  //             color: verified[2] ? Color(0xffC1FFC0) : Colors.transparent,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(40),
  //             ),
  //             child: Container(
  //               width: 120,
  //               height: 40,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Icon(
  //                     Icons.cancel_rounded,
  //                     color: CustomColor.textColor,
  //                     size: 18,
  //                   ),
  //                   SizedBox(width: 5),
  //                   SelectableText(
  //                     "Not Verified",
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.w600,
  //                       color: CustomColor.textColor,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget content(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: !isloading
          ? data.isNotEmpty
              ? Container(
                  width: MediaQuery.of(context).size.width - 10,
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
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText(
                                      data[index]['name'] ?? "None",
                                      toolbarOptions: ToolbarOptions(
                                          copy: true,
                                          selectAll: true,
                                          cut: false,
                                          paste: false),
                                      style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColor.textColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SelectableText(
                                      "${data[index]['city'] ?? ""} | ${data[index]['state'] ?? widget.state}",
                                      toolbarOptions: ToolbarOptions(
                                          copy: true,
                                          selectAll: true,
                                          cut: false,
                                          paste: false),
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: CustomColor.textColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      Icon(
                                        CupertinoIcons.phone_fill,
                                        size: 20,
                                        color: CustomColor.textColor,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SelectableText(
                                        data[index]['phone'].toString(),
                                        toolbarOptions: ToolbarOptions(
                                            copy: true,
                                            selectAll: true,
                                            cut: false,
                                            paste: false),
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: CustomColor.textColor,
                                        ),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SelectableText(
                                          "Details",
                                          toolbarOptions: ToolbarOptions(
                                              copy: true,
                                              selectAll: true,
                                              cut: false,
                                              paste: false),
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
                                          child: SelectableText(
                                            "${data[index]['details'] ?? "None"}",
                                            toolbarOptions: ToolbarOptions(
                                                copy: true,
                                                selectAll: true,
                                                cut: false,
                                                paste: false),
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
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
                                        SelectableText(
                                          "Last Verified",
                                          toolbarOptions: ToolbarOptions(
                                              copy: true,
                                              selectAll: true,
                                              cut: false,
                                              paste: false),
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
                                          child: SelectableText(
                                            "${data[index]['last_verified_at'] != null ? DateFormat("hh:mm a dd MMM yy").format(DateTime.parse(data[index]['last_verified_at'])) : "None"}",
                                            toolbarOptions: ToolbarOptions(
                                                copy: true,
                                                selectAll: true,
                                                cut: false,
                                                paste: false),
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
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
                                        SelectableText(
                                          "Last Updated",
                                          toolbarOptions: ToolbarOptions(
                                              copy: true,
                                              selectAll: true,
                                              cut: false,
                                              paste: false),
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
                                          child: SelectableText(
                                            "${DateFormat("hh:mm a dd MMM yy").format(DateTime.parse(data[index]['updated_at']))}",
                                            toolbarOptions: ToolbarOptions(
                                                copy: true,
                                                selectAll: true,
                                                cut: false,
                                                paste: false),
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
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
                                          width: 110,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SelectableText(
                                                  "Oxygen",
                                                  toolbarOptions:
                                                      ToolbarOptions(
                                                          copy: true,
                                                          selectAll: true,
                                                          cut: false,
                                                          paste: false),
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
                                                Icon(
                                                  Icons.check_box_rounded,
                                                  color: CustomColor.textColor,
                                                  size: 18,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                SelectableText(
                                                  "Verified",
                                                  toolbarOptions:
                                                      ToolbarOptions(
                                                          copy: true,
                                                          selectAll: true,
                                                          cut: false,
                                                          paste: false),
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
                    ),
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height - 300,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Image.asset(
                    "result.webp",
                    width: 300,
                  )),
                )
          : Container(
              height: MediaQuery.of(context).size.height - 300,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                ),
              ),
            ),
    );
  }
}
