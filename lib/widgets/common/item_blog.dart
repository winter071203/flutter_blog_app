

import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/helpers/image_helper.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:flutter/material.dart';

class ItemBlog extends StatelessWidget {
  final BlogModel blog;
  const ItemBlog({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
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
                        Row(
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
                        Spacer(),
                        Text(
                          convertDate(blog.createdAt!),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

    String convertDate(String date) {
    return '${DateTime.parse(date).hour.toString()}:${DateTime.parse(date).minute.toString()} ${DateTime.parse(date).day.toString()}/${DateTime.parse(date).month.toString()}/${DateTime.parse(date).year.toString()}';
  }

}