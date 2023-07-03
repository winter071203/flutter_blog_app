

import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/helpers/image_helper.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/pages/detail_post_page.dart';
import 'package:blog_app/pages/other_profile_page.dart';
import 'package:blog_app/utils/convert_date.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ItemBlog extends StatelessWidget {
  final BlogModel blog;
  const ItemBlog({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailPostPage(blog: blog), transition: Transition.rightToLeft);
      },
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        height: size.height / 3.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ],
        ),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: ImageHelper.loadImageNetWork(blog.thumbnail!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)))),
            Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.title!,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => OtherProfile(id: blog.user!.sId!));
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundImage:
                                        NetworkImage(blog.user?.avatar ?? ''),
                                  ),
                                  SizedBox(
                                    width: kMinPadding,
                                  ),
                                  Text(
                                    blog.user?.name ?? '',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            convertDate(blog.createdAt!),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }


}
