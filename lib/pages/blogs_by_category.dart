


import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/repositories/blog_repository.dart';
import 'package:blog_app/widgets/common/item_blog.dart';
import 'package:flutter/material.dart';

class BlogsByCategory extends StatefulWidget {
  const BlogsByCategory({super.key, required this.id, required this.nameCategory});
  final String id;
  final String nameCategory;

  @override
  State<BlogsByCategory> createState() => _BlogsByCategoryState();
}

class _BlogsByCategoryState extends State<BlogsByCategory> {
  bool isLoading  = false;
  List<BlogModel> listBlog = [];

  @override
  void initState() {
    super.initState();
    getBlogsByCategory();
  }


  void getBlogsByCategory() async {
    setState(() {
      isLoading = !isLoading;
    });
    final BlogRepository blogRepository = BlogRepository();
    final res = await blogRepository.getBlogsByCategory(widget.id);
    if(res != null) {
      setState(() {
        listBlog = res;
        isLoading = !isLoading;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nameCategory[0].toUpperCase() + widget.nameCategory.substring(1), style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child:
          isLoading ? Center(child: CircularProgressIndicator()) :
          ListView.builder(
          itemCount: listBlog.length,
          itemBuilder: (context, index) {
            return ItemBlog(blog: listBlog[index]);
          },
        )
        ),
    );
  }
}