import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  static const String routeName = '/change_password_page';
  const ChangePasswordPage({super.key});

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
              decoration: InputDecoration(
                labelText: 'Current Password',
              ),
            ),
            const SizedBox(height: kMediumPadding),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'New Password',
              ),
            ),
            const SizedBox(height: kMediumPadding),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
              ),
            ),
            const SizedBox(height: kMediumPadding * 2),
            ButtonWidget(title: 'Save Password', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
