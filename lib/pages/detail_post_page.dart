
import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/pages/comments_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';


class DetailPostPage extends StatefulWidget {
  static const String routeName = '/detail-post-page';
  final BlogModel blog;
  const DetailPostPage({super.key, required this.blog});

  @override
  State<DetailPostPage> createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.blog.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${widget.blog.user!.name},', style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),),
                      const SizedBox(width: kMinPadding,),
                  Text(convertDate(widget.blog.createdAt!), style: TextStyle(fontSize: 16),),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding,),
                  Text(widget.blog.description!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorPalette.primaryColor)),
                  const SizedBox(height: kDefaultPadding,),
                  Html(data: widget.blog.content,
                  style: 
                  {
                    "p": Style(
                      fontSize: FontSize(18),
                      fontWeight: FontWeight.bold,
                    ),
                    "h1": Style(
                      fontSize: FontSize(20),
                      fontWeight: FontWeight.bold,
                    ),
                    "h2": Style(
                      fontSize: FontSize(18),
                      fontWeight: FontWeight.bold,
                    ),
                    "h3": Style(
                      fontSize: FontSize(16),
                      fontWeight: FontWeight.bold,
                    ),
                    "h4": Style(
                      fontSize: FontSize(14),
                      fontWeight: FontWeight.bold,
                    ),
                    "h5": Style(
                      fontSize: FontSize(12),
                      fontWeight: FontWeight.bold,
                    ),
                    "h6": Style(
                      fontSize: FontSize(10),
                      fontWeight: FontWeight.bold,
                    ),
                  }
                  ,),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalette.primaryColor,
        onPressed: () {
          Get.to(() => CommentsPage(id: widget.blog.sId!), transition: Transition.rightToLeftWithFade, duration: Duration(milliseconds: 200));
        },
        child: Icon(FontAwesomeIcons.comment, color: Colors.white,),
      )
    );
  }

      String convertDate(String date) {
    return '${DateTime.parse(date).hour.toString()}:${DateTime.parse(date).minute.toString()} ${DateTime.parse(date).day.toString()}/${DateTime.parse(date).month.toString()}/${DateTime.parse(date).year.toString()}';
  }
}