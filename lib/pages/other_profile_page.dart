import 'package:blog_app/blocs/user_bloc/user_bloc.dart';
import 'package:blog_app/blocs/user_bloc/user_event.dart';
import 'package:blog_app/blocs/user_bloc/user_state.dart';
import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/models/user_model.dart';
import 'package:blog_app/repositories/user_repository.dart';
import 'package:blog_app/widgets/common/item_blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class OtherProfile extends StatefulWidget {
  final String id;
  const OtherProfile({Key? key, required this.id}) : super(key: key);
  @override
  State<OtherProfile> createState() => _OtherProfileState();
}

class _OtherProfileState extends State<OtherProfile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => UserBloc(userRepository: UserRepository())
        ..add(GetUserProfile(widget.id)),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, userProfileState) {
              if (userProfileState is GetUserLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (userProfileState is GetUserSuccess) {
                return Stack(
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
                      child: Stack(children: [
                                  Positioned(
                                      top: 35,
                                      left: kDefaultPadding,
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(Icons.arrow_back_ios),
                                          color: Colors.white,
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundImage:
                                              NetworkImage(userProfileState.user.avatar!),
                                        ),
                                        SizedBox(
                                          width: kDefaultPadding,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              userProfileState.user.name!,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              userProfileState.user.account!,
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
                                      ],
                                    ),
                                  ),
                                ])
                    ),
                    DraggableScrollableSheet(
                      initialChildSize: 0.75,
                      minChildSize: 0.75,
                      maxChildSize: 0.75,
                      builder: ((context, scrollController) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: kMediumPadding),
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
                              Expanded(
                                child: ListView.builder(
                                  controller: scrollController,
                                  itemCount: userProfileState.listBlogs!.total.toInt(),
                                  itemBuilder: (context, index) {
                                    return ItemBlog(
                                      blog: userProfileState.listBlogs!.blogs[index],
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    )
                  ],
                );
              } else {
                return Center(
                  child: Text('No data'),
                );
              }
            },
          )),
    );
  }
}
