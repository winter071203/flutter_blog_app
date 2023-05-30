import 'package:blog_app/blocs/blog_bloc/blog_bloc.dart';
import 'package:blog_app/blocs/blog_bloc/blog_event.dart';
import 'package:blog_app/blocs/blog_bloc/blog_state.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/models/user_model.dart';
import 'package:blog_app/repositories/home_repository.dart';
import 'package:blog_app/widgets/common/item_blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});
  final UserModel user;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  final HomeRepository homeRepository = HomeRepository();
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => BlogBloc(homeRepository: homeRepository)..add(FetchBlog()),
      child: Scaffold(
          body: Column(
        children: <Widget>[
          homeAppBar(context, size),
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

  Widget homeAppBar(BuildContext context, Size size) {
    return Container(
      height: size.height / 10,
      padding: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          bottom: kDefaultPadding),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Winter Blog',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.user.avatar!),
              radius: 20,
            ),
          )
        ],
      ),
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
              Text(
                listBlogCategory![index].name![0].toUpperCase() +
                    listBlogCategory[index].name!.substring(1),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
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
