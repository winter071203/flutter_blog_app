import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/pages/splash_page.dart';
import 'package:blog_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    connectAndListen();
  }

  void connectAndListen() {
    print('call func connectAndListen');
    IO.Socket socket = IO.io('http://192.168.110.101:5000',
        IO.OptionBuilder().setTransports(['websocket']).build());
    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });
    socket.onDisconnect((_) => print('disconnect'));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
            iconTheme:
                IconThemeData(color: ColorPalette.primaryColor.withOpacity(.5)),
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
            textTheme: TextTheme(
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
