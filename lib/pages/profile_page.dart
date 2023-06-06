import 'package:blog_app/blocs/blog_user_bloc/blog_user_bloc.dart';
import 'package:blog_app/blocs/blog_user_bloc/blog_user_event.dart';
import 'package:blog_app/blocs/blog_user_bloc/blog_user_state.dart';
import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/models/auth_model.dart';
import 'package:blog_app/pages/edit_profile_page.dart';
import 'package:blog_app/pages/setting_page.dart';
import 'package:blog_app/repositories/blog_user_repository,.dart';
import 'package:blog_app/widgets/common/item_blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.authModel});
  final AuthModel authModel;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final user = widget.authModel.user!;
    return BlocProvider(
      create: (context) =>
          BlogUserBloc(blogUserReposotory: BlogUserReposotory())
            ..add(GetBlogsUser(id: user.sId!)),
      child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                  child: Container(
                color: ColorPalette.primaryColor,
              )),
              Container(
                height: size.height * 0.25,
                width: size.width,
                decoration: BoxDecoration(
                  color: ColorPalette.primaryColor,
                ),
                child: Stack(
                  children:  [
                    Positioned(
                      top: size.height * 0.05,
                      right: kDefaultPadding,
                      child: IconButton(
                        onPressed: () {
                          Get.to(() => SettingPage(authModel: widget.authModel));
                        },
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(user.avatar!),
                      ),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name ?? 'No Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            user.account ?? 'No Email',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                                            SizedBox(
                        width: kDefaultPadding,
                      ),
                      IconButton(onPressed: () {
                        Get.to(() => EditProfileUserPage(auth: widget.authModel));
                      }, icon: Icon(FontAwesomeIcons.pen, size: 20, color: Colors.white,))
                    ],
                  ),]
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.75,
                minChildSize: 0.75,
                maxChildSize: 0.75,
                builder: ((context, scrollController) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kMediumPadding),
                        topRight: Radius.circular(kMediumPadding),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: kDefaultPadding),
                          child: Center(
                              child: Text(
                            'Blogs:',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                        ),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        BlocBuilder<BlogUserBloc, BlogUserState>(
                          builder: (context, blogUserState) {
                            if (blogUserState is BlogUserLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (blogUserState is BlogUserSuccess) {
                              print(blogUserState.blogsUser.blogs!.length);
                              return Expanded(
                                child: ListView.builder(
                                  controller: scrollController,
                                  itemCount:
                                      blogUserState.blogsUser.blogs!.length,
                                  itemBuilder: (context, index) {
                                    return ItemBlog(
                                      blog: blogUserState.blogsUser.blogs![index],
                                    );
                                  },
                                ),
                              );
                            }
                            return Center(
                              child: Text('No Blogs'),
                            );
                          },
                        )
                      ],
                    ),
                  );
                }),
              )
            ],
          )),
    );
  }
}
