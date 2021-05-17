import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
// ignore: camel_case_types
double height=251.21;
double weight=0;
double f1=30;
double f2=18;
double f3=24;
double f4=13;
double hBox1=40;
double hBox2=25;
double rCircle=16;
class kContainer extends StatelessWidget {
  kContainer({ this.t1,this.i1, this.p1, this.text1String,  this.text2String,  this.colors,  this.color1});
  final String t1;
  final String i1;
  final String p1;
  final String text1String;
  final String text2String;
  final Color colors;
  final Color color1;
  @override
  Widget build(BuildContext context) {
    weight = MediaQuery. of(context). size. width/2;
    if((weight*2)>767);
    else
      {
       weight = MediaQuery. of(context). size. width/2;
       height=100.32;
       rCircle=8;
       hBox1=5;
       f1=20;
       f2=16;
      }
    return
      Container(
     height: height,
      width: weight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(rCircle),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: hBox1,),
          covidStats_Row(title: t1,percent: p1,img: i1,colors2: color1,),
          SizedBox(height: hBox1),
        FittedBox(
            fit:BoxFit.fill,
            child:AnimatedTextKit(animatedTexts:[TypewriterAnimatedText
            ('$text1String',
            textStyle:TextStyle(
              color:colors,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.75,
              fontSize: f1,
            ),
          ),
          ],
          ),
        ),
   SizedBox(height: 9.89),
      FittedBox(
        fit: BoxFit.fill,
          child:AnimatedTextKit(animatedTexts: [TypewriterAnimatedText('+$text2String',
          textStyle:TextStyle(
                color:colors,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.75,
                fontSize: f2,
              )
          ),
        ],
      ),
      ),
        ]
      ),
    );
  }
}
// ignore: camel_case_types
class covidStats_Row extends StatelessWidget {
  covidStats_Row({this.title, this.img,this.percent, this.colors2});
  final String title;
  final String img;
  final String percent;
  final Color colors2;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    if(width>767);
    else
      {
        f3=12;
        f4=10;
      }
     return Flexible(
    child:Row(
       mainAxisAlignment:MainAxisAlignment.center,
      children: [
        Text(title,
          style: TextStyle(
            color: Color(0xFF6E7191),
            letterSpacing: 0.75,
            fontWeight: FontWeight.w600,
            fontSize: f3,
          ),
        ),
     Container(
        child:Image.asset('$img.png',width: 10,height: 10,),
        ),
     FittedBox(
       fit:BoxFit.fill,
       child: AnimatedTextKit(animatedTexts: [TypewriterAnimatedText(percent.toString()+'%',
          textStyle: TextStyle(
            color: colors2,
            fontSize: f4,
            wordSpacing: 0.75,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
          ),
        ),
      ]
        ),
     ),
      ],
     ),
      );
  }
}