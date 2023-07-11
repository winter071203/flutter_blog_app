import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/helpers/show_snack_bar_helper.dart';
import 'package:blog_app/repositories/user_repository.dart';
import 'package:blog_app/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordPage extends StatefulWidget {
  static const String routeName = '/change_password_page';
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: ColorPalette.primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: kMediumPadding * 2),
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            TextFormField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Current Password',
              ),
            ),
            const SizedBox(height: kMediumPadding),
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'New Password',
              ),
            ),
            const SizedBox(height: kMediumPadding),
            TextFormField(
              obscureText: true,
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
              ),
            ),
            const SizedBox(height: kMediumPadding * 2),
            ButtonWidget(
                title: 'Save Password',
                onPressed: () async {
                  showDialog(
                      // The user CANNOT close this dialog  by pressing outsite it
                      barrierDismissible: false,
                      context: context,
                      builder: (_) {
                        return Dialog(
                          // The background color
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                // The loading indicator
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 15,
                                ),
                                // Some text
                                Text('Loading...')
                              ],
                            ),
                          ),
                        );
                      });
                  if (_passwordController.text !=
                      _confirmPasswordController.text) {
                    Future.delayed(Duration(seconds: 1), () {
                      Navigator.of(context).pop();
                    });
                    Get.snackbar('Error', 'Password not match',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM);
                  } else {
                    final UserRepository _userRepository = UserRepository();
                    final Future<SharedPreferences> prefs =
                        SharedPreferences.getInstance();
                    final SharedPreferences _sharedPreferences = await prefs;
                    final String token =
                        _sharedPreferences.getString('accessToken')!;
                    final res = await _userRepository.resetPassword(
                        _currentPasswordController.text,
                        _passwordController.text,
                        token);
                    if (res['statusCode'] == 500) {
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.of(context).pop();
                      });
                      return Get.snackbar('Error', res['msg'],
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                    Future.delayed(Duration(seconds: 1), () {
                      Navigator.of(context).pop();
                    });
                    Get.snackbar('Success', res['msg'],
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM);
                    _currentPasswordController.text = '';
                    _passwordController.text = '';
                    _confirmPasswordController.text = '';
                  }
                })
          ],
        ),
      ),
    );
  }
}
