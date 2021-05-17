import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'getData.dart';
 List<dynamic> stateName=[];
class CovidStatsData extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<CovidStatsData> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataCovid().then((value){
      setState(() {
        stateName=value['regionData'];
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    if (width > 768) {
   return ViewCovidStat(h1: 48,f1: 15,);
    }
    else
      {
        return ViewCovidStat(h1:18,f1:6);
      }
  }
}

// ignore: must_be_immutable
class HeadingText extends StatelessWidget {
  HeadingText({this.heading, this.colors, this.fontSize});
  final String heading;
  final Color colors;
  double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(heading,style:TextStyle(
      color:colors,
      fontSize: fontSize,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.75,
      fontWeight: FontWeight.bold,
    ),
    );
  }
}
class ViewCovidStat extends StatelessWidget {
  ViewCovidStat({ this.h1,this.f1});
  double h1;
  double f1;
  @override
  Widget build(BuildContext context) {
    List<double> padding=[];
    String chr;
    if( MediaQuery. of(context). size.width>767)
      {
        padding=[50, 20, 50, 50];
        chr="";
      }
    else{
       padding=[5, 10, 5, 10];
       chr='\n';
       fsize=8;
    }
   return Material(
     child:Scaffold(
       appBar: AppBar(
        // backgroundColor: Color(0xFFFAFAFA),
         backgroundColor: Colors.transparent,
         bottomOpacity: 0.0,
         elevation: 0.0,
           iconTheme: IconThemeData(
             color: Colors.black, //change your color here
           ),
         title:  Center(
           child: Text(
             'Covid-19 Statewise Status',
             style: TextStyle(
               fontWeight: FontWeight.w600,
               fontSize: h1,
               fontStyle: FontStyle.normal,
               letterSpacing: 0.75,
               color: Color(0xFF4E4B66),
             ),
           ),
         ),
       ),
     body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(child: Container(
                    decoration: BoxDecoration(
                      // color: Color(0XFFEFF0F6),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(padding[0], padding[1], padding[2], padding[3]),
                      child: Table(
                        columnWidths: {
                        /*  0: FlexColumnWidth(1.5),
                          1: FlexColumnWidth(1.0),
                          2: FlexColumnWidth(1.0),
                          3: FlexColumnWidth(1.0),
                          4: FlexColumnWidth(1.0),
                          5: FlexColumnWidth(1.2),
                          6: FlexColumnWidth(1.0),
                          7: FlexColumnWidth(1.2),*/
                          0: FlexColumnWidth(10.5),
                          1: FlexColumnWidth(5.0),
                          2: FlexColumnWidth(5.0),
                          3: FlexColumnWidth(5.0),
                          4: FlexColumnWidth(5.2),
                          5: FlexColumnWidth(5.2),
                          6: FlexColumnWidth(5.0),
                          7: FlexColumnWidth(5.2)
                        },
                        border: TableBorder.all(width: 1,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                        children: [
                          TableRow(children: [
                            Center(child: HeadingText(
                              colors: Color(0XFF5066FF),
                              fontSize: f1,
                              heading: 'State',)),
                            Center(child: HeadingText(
                                colors: Color(0xFFFF0000),
                                fontSize: f1,
                                heading: 'Total'+chr+'Cases')),
                            Center(child: HeadingText(
                              colors: Color(0xFF0066FF),
                              fontSize: f1,
                              heading: 'Active'+chr+'Cases',)),
                            Center(child: HeadingText(
                              colors: Color(0xFF0066FF),
                              fontSize: f1,
                              heading: 'New'+chr+'Infected',)),
                            Center(child: HeadingText(
                              colors: Color(0xFF05E945),
                              fontSize: f1,
                              heading: 'Recovered',)),
                            Center(child: HeadingText(
                              colors: Color(0xFF08FF4D),
                              fontSize: f1,
                              heading: 'New'+chr+'Recovered',)),
                            Center(child: HeadingText(
                              colors: Color(0xFF6E7191),
                              fontSize: f1,
                              heading: 'Deceased',)),
                            Center(child: HeadingText(
                              colors: Color(0xFF6E7191),
                              fontSize: f1,
                              heading: 'New'+chr+'Deceased',)),
                          ]),
                          for( var i in stateName)
                            TableRow(
                              children: [
                                Center(child: AnimatedTextKit(animatedTexts: [TypewriterAnimatedText(
                                    i['region'], textStyle:kTextStyle2,textAlign: TextAlign.center,),] )),
                                Center(child: AnimatedTextKit(animatedTexts: [TypewriterAnimatedText(
                                    i['activeCases'].toString(),
                                    textStyle: kTextStyle2)]),),
                                Center(child: AnimatedTextKit(animatedTexts: [TypewriterAnimatedText(
                                    i['newInfected'].toString(),
                                    textStyle: kTextStyle2)]),),
                                Center(
                                    child: AnimatedTextKit(animatedTexts: [TypewriterAnimatedText(i['recovered'].toString(),
                                        textStyle: kTextStyle2)])),
                                Center(child:AnimatedTextKit(animatedTexts: [TypewriterAnimatedText(
                                    i['newRecovered'].toString(),
                                    textStyle: kTextStyle2)])),
                                Center(child: AnimatedTextKit(animatedTexts: [TypewriterAnimatedText(
                                    i['deceased'].toString(),
                                    textAlign: TextAlign.center,
                                    textStyle: kTextStyle2)])),
                                Center(child: AnimatedTextKit(animatedTexts: [TypewriterAnimatedText(
                                    i['newDeceased'].toString(),
                                    textStyle: kTextStyle2)])),
                                Center(child: AnimatedTextKit(animatedTexts: [TypewriterAnimatedText(
                                    i['totalInfected'].toString(),
                                    textStyle: kTextStyle2)])),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(padding[0], 0, padding[2], 0),
                      child: Text(
                        "Note: '-' and '+' shows ↑↓ status change since yesterday.",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                        ),
                      ),
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
}
