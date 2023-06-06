import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/helpers/asset_helper.dart';
import 'package:blog_app/helpers/image_helper.dart';
import 'package:blog_app/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const String routeName = '/register_page';
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isShowPassword = false;
  bool _isShowConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
  final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: ImageHelper.loadImageAsset(AssetHelper.imgLogin,
                  fit: BoxFit.cover)),
          Container(
            height: size.height * 0.35,
            width: size.width,
            color: Colors.black.withOpacity(0.5),
            child: Stack(children: [
              Positioned(
                left: kDefaultPadding,
                top: kMediumPadding * 2,
                child: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back, color: Colors.white,))),
              Center(
                child: Text(
                  'Winter Blog',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 10,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.3),
            padding: EdgeInsets.all(kDefaultPadding),
            height: size.height * .75,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding * 2),
                  topRight: Radius.circular(kDefaultPadding * 2),
                )),
            child: Column(
              children: [
                Text(
                  'REGISTER',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5),
                ),
                const SizedBox(
                  height: kDefaultPadding * 2,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: _accountController,
                      decoration: InputDecoration(
                        fillColor: ColorPalette.primaryColor.withOpacity(.2),
                        filled: true,
                        hintText: 'Account',
                        hintStyle: TextStyle(
                            color: ColorPalette.text1Color.withOpacity(.5)),
                        prefixIcon: Icon(
                          FontAwesomeIcons.solidCircleUser,
                          color: ColorPalette.primaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      style: TextStyle(color: ColorPalette.text1Color),
                      obscureText: !_isShowPassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        hintStyle: TextStyle(
                            color: ColorPalette.text1Color.withOpacity(.5)),
                        prefixIcon: Icon(
                          FontAwesomeIcons.lock,
                          color: ColorPalette.primaryColor,
                        ),
                        suffixIcon: IconButton(
                            icon: _isShowPassword
                                ? Icon(
                                    FontAwesomeIcons.solidEyeSlash,
                                    color: ColorPalette.primaryColor,
                                  )
                                : Icon(
                                    FontAwesomeIcons.solidEye,
                                    color: ColorPalette.primaryColor,
                                  ),
                            onPressed: () {
                              setState(() {
                                _isShowPassword = !_isShowPassword;
                              });
                            }),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      style: TextStyle(color: ColorPalette.text1Color),
                      obscureText: !_isShowConfirmPassword,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        filled: true,
                        hintStyle: TextStyle(
                            color: ColorPalette.text1Color.withOpacity(.5)),
                        prefixIcon: Icon(
                          FontAwesomeIcons.lock,
                          color: ColorPalette.primaryColor,
                        ),
                        suffixIcon: IconButton(
                            icon: _isShowConfirmPassword
                                ? Icon(
                                    FontAwesomeIcons.solidEyeSlash,
                                    color: ColorPalette.primaryColor,
                                  )
                                : Icon(
                                    FontAwesomeIcons.solidEye,
                                    color: ColorPalette.primaryColor,
                                  ),
                            onPressed: () {
                              setState(() {
                                _isShowConfirmPassword = !_isShowConfirmPassword;
                              });
                            }),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                      ),
                    ),
                  ],
                )),
                const SizedBox(
                  height: kDefaultPadding * 2,
                ),
                ButtonWidget(title: 'Register', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
