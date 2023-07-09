import 'package:blog_app/blocs/blog_bloc/blog_bloc.dart';
import 'package:blog_app/blocs/blog_bloc/blog_event.dart';
import 'package:blog_app/blocs/blog_bloc/blog_state.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/models/user_model.dart';
import 'package:blog_app/pages/add_blog_page.dart';
import 'package:blog_app/pages/blogs_by_category.dart';
import 'package:blog_app/repositories/blog_repository.dart';
import 'package:blog_app/widgets/common/item_blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});
  final UserModel user;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  final BlogRepository blogRepository = BlogRepository();
    return BlocProvider(
      create: (context) => BlogBloc(homeRepository: blogRepository)..add(FetchBlog()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text('Winter Blog', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: () {
              // Get.to(() => AddBlogPageStep1());
            }, icon: Icon(FontAwesomeIcons.plus))
          ],
        ),
          body: Column(
        children: <Widget>[
          BlocBuilder<BlogBloc, BlogState>(builder: (context, homeBlogState) {
            if (homeBlogState is BlogLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (homeBlogState is BlogFailure) {
              return const Center(child: Text('Error'));
            } else if (homeBlogState is BlogSuccess) {
              return Expanded(child: _buildListBlogCategory(context));
            }
            return const Center(child: Text('Error'));
          })
        ],
      )),
    );
  }



  Widget _buildListBLogs(BuildContext context, List<BlogModel> listBlogs) {
    return Column(
      children: listBlogs.map((e) {
        return ItemBlog(blog: e,);
      }).toList(),
    );
  }

  Widget _buildListBlogCategory(BuildContext context) {
    final listBlogCategory = context.select((BlogBloc bloc) {
      if (bloc.state is BlogSuccess) {
        return (bloc.state as BlogSuccess).blogs;
      }
      return null;
    });
    return Container(
      color: Colors.grey.withOpacity(.2),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: ListView.builder(
        itemCount: listBlogCategory?.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: kDefaultPadding,
              ),
              Row(
                children: [
                  Text(
                    listBlogCategory![index].name![0].toUpperCase() +
                        listBlogCategory[index].name!.substring(1),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => BlogsByCategory(id: listBlogCategory[index].sId!, nameCategory: listBlogCategory[index].name!,));
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              _buildListBLogs(context, listBlogCategory[index].blogs!)
            ],
          );
        },
      ),
    );
  }
}
