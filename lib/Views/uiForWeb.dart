import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ContainerView.dart';
import 'constants.dart';
Widget webUI(context) {
  {
    //return LayoutBuilder(builder: (context, size) {
      return SingleChildScrollView(
       child:Column(
          children: <Widget>[
            SizedBox(height: 50), 
            Center(
              child: Text(
                'Covid-19 India',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 48,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.75,
                  color: Color(0xFF4E4B66),
                ),
              ),
            ),
            Padding(
            padding: EdgeInsets.fromLTRB(20, 60, 10, 63),
            child:Container(
              decoration: BoxDecoration(
                color: Color(0XFFEFF0F6),
                borderRadius: BorderRadius.all(
                  Radius.circular(16)
              ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 0, 33),
                      child: Container(
                        height: 251.21,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width /2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Total Cases',
                              style: TextStyle(
                                color: Color(0xFF6E7191),
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.75,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Flexible(child:
                            Text(
                                totalCase,
                                style: TextStyle(color: Color(0xFFFF0000),
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.75,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      //padding: EdgeInsets.fromLTRB(10, 60, 20, 63),
                      padding: EdgeInsets.fromLTRB(20, 30, 0, 33),
                      child: kContainer(t1: 'Active ',
                        p1: perCentActive,
                        i1: 'Down',
                        text1String: activeCase,
                        text2String: newActiveCase,
                        colors: Color(0xFF0066FF),
                        color1: Color(0xFFFF0000),),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      //padding: EdgeInsets.fromLTRB(10, 60, 20, 63),
                      padding: EdgeInsets.fromLTRB(20, 30, 0, 33),
                      child: kContainer(t1: 'Recovered ',
                          p1: perCentRecovered,
                          i1: 'up',
                          text1String: recover,
                          text2String: newRecover,
                          colors: Color(0xFF05E945),
                          color1: Color(0xFF05E945)),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                     // padding: EdgeInsets.fromLTRB(10, 60, 20, 63),
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 33),
                      child: kContainer(t1: 'Decreased ',
                        p1: perCentDeaths,
                        i1: 'down',
                        text1String: deaths,
                        text2String: newDeaths,
                        colors: Color(0xFF6E7191),
                        color1: Color(0xFFFF0000),),
                    ),
                  ),
                ],
              ),
            ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
             // padding: EdgeInsets.fromLTRB( 60, 0, 60,0),
              padding: EdgeInsets.fromLTRB(100, 0,100, 0),
           child: Container(
              decoration: BoxDecoration(
                color: Color(0XFFEFF0F6),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 // Container(
               //     child:
              Image.asset('vec1.png'),
               //   ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('$vacData', style: TextStyle(
                          color: Color(0XFF05E945),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.75,
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                        ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                        child:Text('Vaccine doses administered',
                              style: TextStyle(
                                color: Color(0xFF6E7191),
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.75,
                                fontSize: 20,
                                fontStyle: FontStyle.normal,
                              )
                          ),
                  ),
                ],
              ),
            ),
            ),
            SizedBox(height: 5),
            TExtButton(),
            SizedBox(height: 50,),
            PieChart(radius: '100%'),
          ]
       ),
      );
    }
    //);
 // }
}



