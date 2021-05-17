import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ContainerView.dart';
import 'constants.dart';
Widget webMobileUI(context)
{  return LayoutBuilder(builder: (context, size)
{
  return SingleChildScrollView(
    child: Column(
      children: [
        Center(
          child: Text('Covid-19 India',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.75,
              color: Color(0xFF4E4B66),
            ),
          ),
        ),
        Container(
          color: Color(0XFFEFF0F6),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 15, 15, 20),
                      child: Container(
                        height: 100.0,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Total Cases',
                              style: TextStyle(
                                color: Color(0xFF6E7191),
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.75,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Flexible(child: Text(
                              totalCase,
                              style: TextStyle(color: Color(0xFFFF0000),
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.75,
                                fontSize: 16,
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
                      padding: EdgeInsets.fromLTRB(10, 15, 15, 20),
                      child: kContainer(t1: 'Active ',
                        p1: perCentActive,
                        i1: 'down',
                        text1String: activeCase,
                        text2String: newActiveCase,
                        colors: Color(0xFF0066FF),
                        color1: Color(0xFFFF0000),),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 15, 15, 20),
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
                      padding: EdgeInsets.fromLTRB(10, 15, 15, 20),
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
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
        SizedBox(
          height: 23,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0XFFEFF0F6),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Wrap(
            // mainAxisAlignment: MainAxisAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset('vec1.png'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(2, 5, 5, 2),
                child: Center(
                  child: Text(
                    '$vacData',
                    style: TextStyle(
                      color: Color(0XFF05E945),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.75,
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child:
                Center(
                  child: Text(
                    'Vaccine doses administered.',
                    style: TextStyle(
                      color: Color(0xFF6E7191),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.75,
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        TExtButton(),
        SizedBox(height: 50),
        PieChart(radius: '50%',),
      ],
    ),
  );
}
);
}