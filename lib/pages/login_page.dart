import 'package:blog_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:blog_app/blocs/auth_bloc/auth_event.dart';
import 'package:blog_app/blocs/auth_bloc/auth_state.dart';
import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/helpers/asset_helper.dart';
import 'package:blog_app/helpers/image_helper.dart';
import 'package:blog_app/pages/main_app_page.dart';
import 'package:blog_app/pages/register_page.dart';
import 'package:blog_app/repositories/auth_repository.dart';
import 'package:blog_app/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login_page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepository = AuthRepository();
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthBloc(authRepository: authRepository),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
            if (authState is AuthFailure) {
                            Future.delayed(Duration.zero, () {
                Get.snackbar('Error', 'Email or password is incorrect!',
                    colorText: Colors.white,
                    backgroundColor: Colors.green,
                    snackPosition: SnackPosition.BOTTOM);
              });
            } else if (authState is AuthSuccess) {
              Future.delayed(Duration.zero, () {
                Get.to(() => MainAppPage(
                      authModel: authState.authModel,
                    ));
              });
            }
            return Stack(
              children: [
                Positioned.fill(
                    child: ImageHelper.loadImageAsset(AssetHelper.imgLogin,
                        fit: BoxFit.cover)),
                Container(
                  height: size.height * 0.35,
                  width: size.width,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
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
                        'LOGIN',
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
                            autovalidateMode: AutovalidateMode.always,
                            decoration: InputDecoration(
                              fillColor:
                                  ColorPalette.primaryColor.withOpacity(.2),
                              filled: true,
                              hintText: 'Account',
                              hintStyle: TextStyle(
                                  color:
                                      ColorPalette.text1Color.withOpacity(.5)),
                              prefixIcon: Icon(
                                FontAwesomeIcons.solidCircleUser,
                                color: ColorPalette.primaryColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(kDefaultPadding),
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
                            autovalidateMode: AutovalidateMode.always,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              filled: true,
                              hintStyle: TextStyle(
                                  color:
                                      ColorPalette.text1Color.withOpacity(.5)),
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
                                borderRadius:
                                    BorderRadius.circular(kDefaultPadding),
                              ),
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(
                        height: kDefaultPadding * 2,
                      ),
                      ButtonWidget(
                          title:
                              authState is AuthLoading ? 'Loading...' : 'Login',
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(
                                AuthEventLogin(
                                    account: _accountController.text,
                                    password: _passwordController.text));
                          }),
                      const SizedBox(
                        height: kDefaultPadding * 2,
                      ),
                      Text(
                        'Or login with: ',
                        style: TextStyle(
                            color: ColorPalette.text1Color.withOpacity(.5)),
                      ),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.facebook,
                                color: HexColor('#4267B2'),
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.google,
                                color: HexColor('#DB4437'),
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.twitter,
                                color: HexColor('#1DA1F2'),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: kDefaultPadding * 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                                color: ColorPalette.text1Color.withOpacity(.5)),
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.to(() => RegisterPage());
                              },
                              child: Text(
                                'Sign up',
                                style:
                                    TextStyle(color: ColorPalette.primaryColor),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          })),
    );
  }
}
