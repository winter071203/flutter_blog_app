import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/pages/splash_page.dart';
import 'package:blog_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ThemeProvider(),
        ),
        //Your other providers goes here...
      ],
      child: Consumer<ThemeProvider>(
        builder: (ctx, themeObject, _) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dynamic Theme Demo',
          themeMode: themeObject.mode,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.deepPurple,
            brightness: Brightness.light,
            backgroundColor: Colors.grey[100],
            iconTheme: IconThemeData(color: ColorPalette.primaryColor.withOpacity(.5)),
            textTheme: TextTheme(
              bodyText1: TextStyle(color: ColorPalette.primaryColor),
              bodyText2: TextStyle(color: ColorPalette.primaryColor),
            ),
            fontFamily: 'Karla',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue[300],
            brightness: Brightness.dark,
            backgroundColor: Colors.grey[900],
            fontFamily: 'Karla',
            iconTheme: IconThemeData(color: Colors.white.withOpacity(.5)),
            textTheme:  TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashPage(),
        ),
      ),
    );
  }
}