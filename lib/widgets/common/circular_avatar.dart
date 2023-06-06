

import 'package:blog_app/models/user_model.dart';
import 'package:blog_app/pages/other_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CircularAvatarWidget extends StatefulWidget {
  final UserModel user;
  const CircularAvatarWidget({super.key, required this.user});

  @override
  State<CircularAvatarWidget> createState() => _CircularAvatarWidgetState();
}

class _CircularAvatarWidgetState extends State<CircularAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => OtherProfile(id: widget.user.sId!,));
      },
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey[200],
        child: ClipOval(
          child: SizedBox(
            width: 100,
            height: 100,
            child: (widget.user.avatar != null)
                ? Image.network(
                    widget.user.avatar!,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/user.png',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}