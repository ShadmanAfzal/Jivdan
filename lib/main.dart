import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jivandaan/Views/Details.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Views/HomePage.dart';
import 'Views/Mobile/DashBoard.dart';
import 'Views/Mobile/Details.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Jivandaan',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          routeInformationParser: VxInformationParser(),
          routerDelegate: VxNavigator(
            routes: {
              '/': (context, _) => MaterialPage(
                    child: size.maxWidth > 700 ? HomePage() : DashBoardMobile(),
                  ),
              '/search': (Uri uri, param) => size.maxWidth > 700
                  ? MaterialPage(
                      child: DetailsWeb(
                      service: uri.queryParameters['service'],
                      state: uri.queryParameters['state'],
                    ))
                  : MaterialPage(
                      child: Details(
                      service: uri.queryParameters['service'],
                      state: uri.queryParameters['state'],
                    )),
            },
          ),
        );
      },
    );
  }
}
