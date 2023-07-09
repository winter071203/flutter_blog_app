import 'package:blog_app/helpers/asset_helper.dart';
import 'package:blog_app/helpers/image_helper.dart';
import 'package:blog_app/pages/intro_page.dart';
import 'package:blog_app/pages/login_page.dart';
import 'package:blog_app/pages/main_app_page.dart';
import 'package:blog_app/providers/theme_provider.dart';
import 'package:blog_app/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash_page';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirectIntroPage();
  }

  void redirectIntroPage() async {
    await Future.delayed(const Duration(seconds: 2));
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final introValue = prefs.getString('Intro');
    final refreshToken = prefs.getString('refreshToken');
    final bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    if(isDarkMode) {
      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
    }
    if (refreshToken != null) {
      print(refreshToken);
      final AuthRepository _authRepository = AuthRepository();
      final response = await _authRepository.refreshToken(refreshToken);
      if (response?.refreshToken != null &&  response?.accessToken != null) {
        prefs.setString('refreshToken', response.refreshToken as String);
        prefs.setString('accessToken', response.accessToken as String);
        Get.to(
            () => MainAppPage(
                  authModel: response,
                ),
            transition: Transition.zoom,
            duration: Duration(seconds: 1));
      } else {
        Get.to(() => LoginPage(),
          transition: Transition.zoom);
      }
    } else if (introValue == 'introValue') {
      Get.to(() => LoginPage(),
          transition: Transition.zoom);
      // Navigator.of(context).pushNamed(LoginPage.routeName);
    } else {
      prefs.setString('Intro', 'introValue');
      Get.to(() => IntroPage(),
          transition: Transition.zoom);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ImageHelper.loadImageAsset(AssetHelper.imgLogo),
      ),
    );
  }
}
