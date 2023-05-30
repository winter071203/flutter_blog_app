import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/models/auth_model.dart';
import 'package:blog_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  final AuthModel authModel;
  static const String routeName = '/setting_page';
  const SettingPage({super.key, required this.authModel});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int isOn = 0;
  @override
  Widget build(BuildContext context) {
    bool _darkModeEnabled = Theme.of(context).brightness == Brightness.dark;
    _darkModeEnabled ? isOn = 1 : isOn = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        title: Text(
          'Settings and Privacy',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            _buildItem(context),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.moon,
                color: HexColor('#fbea8d'),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Dark Mode',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          Switch(
            value: isOn == 0 ? false : true,
            onChanged: (value) async {
              final provider =
                  Provider.of<ThemeProvider>(context, listen: false);
              provider.toggleTheme();
              final Future<SharedPreferences> _prefs =
                  SharedPreferences.getInstance();
              final SharedPreferences prefs = await _prefs;
              prefs.setBool('isDarkMode', value);
              setState(() {
                isOn == 0 ? isOn = 1 : isOn = 0;
              });
            },
          ),
        ],
      ),
    );
  }
}
