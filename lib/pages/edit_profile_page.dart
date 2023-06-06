import 'dart:io';
import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/helpers/image_helper.dart';
import 'package:blog_app/models/auth_model.dart';
import 'package:blog_app/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileUserPage extends StatefulWidget {
  static const String routeName = '/edit_profile_user_page';
  final AuthModel auth;
  const EditProfileUserPage({super.key, required this.auth});

  @override
  State<EditProfileUserPage> createState() => _EditProfileUserPageState();
}

class _EditProfileUserPageState extends State<EditProfileUserPage> {
  File? image;

  Future pickImage(ImageSource soure) async {
    try {
      final image = await ImagePicker().pickImage(source: soure);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('pickImage error: $e');
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceBetween,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          title: Text("Choose option?"),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    ColorPalette.primaryColor),
                
              ),
              child: Row(
                children: const [
                  Icon(FontAwesomeIcons.camera),
                  SizedBox(width: kDefaultPadding),
                  Text("Camera"),
                ],
              ),
              onPressed: () {
                pickImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
              ElevatedButton(
              child: Row(
                children: const [
                  Icon(FontAwesomeIcons.image),
                  SizedBox(width: kDefaultPadding),
                  Text("Gallery"),
                ],
              ),
              onPressed: () {
                pickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: ColorPalette.primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: kMediumPadding),
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  width: size.height/6,
                  height: size.height / 6,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: ColorPalette.primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(500),
                  ),
                  child: image != null
                      ? ImageHelper.loadImageFile(image!,
                          borderRadius: BorderRadius.circular(500), fit: BoxFit.cover)
                      : ImageHelper.loadImageNetWork(widget.auth.user!.avatar!,
                          borderRadius: BorderRadius.circular(500), fit: BoxFit.cover),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      _showDialog(context);
                    },
                    child: Container(
                      height:  45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Colors.white),
                        color: ColorPalette.primaryColor,
                      ),
                      child: Icon(
                        FontAwesomeIcons.pen,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: kMediumPadding),
              TextFormField(
                initialValue: widget.auth.user!.name,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              TextFormField(
                initialValue: widget.auth.user!.account,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Row(
                children: [
                  Expanded(
                      child: ButtonWidget(
                          color: Colors.grey.withOpacity(.1),
                          title: 'Cancel',
                          onPressed: () {
                            Get.back();
                          })),
                  const SizedBox(width: kDefaultPadding),
                  Expanded(
                      child: ButtonWidget(title: 'Save', onPressed: () {})),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
