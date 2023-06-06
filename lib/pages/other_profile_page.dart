import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/models/user_model.dart';
import 'package:blog_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class OtherProfile extends StatefulWidget {
  final String id;
  const OtherProfile({Key? key, required this.id}) : super(key: key);
  @override
  State<OtherProfile> createState() => _OtherProfileState();
}

class _OtherProfileState extends State<OtherProfile> {
  UserModel user = UserModel();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getUSer();
  }

  Future<dynamic> getUSer() async {
    final UserRepository userRepository = UserRepository();
    setState(() {
      isLoading = !isLoading;
    });
    try {
      final res = await userRepository.getUser(widget.id);
      setState(() {
        user = res;
      });
      setState(() {
        isLoading = !isLoading;
      });
    } catch (e) {
      setState(() {
        isLoading = !isLoading;
      });
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
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
          child: 
          isLoading ? Center(child: CircularProgressIndicator()) :
          user.avatar != null ?
          Stack(children: [
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
              )
              ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
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
                        user.name!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user.account!,
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
          ]) : Container(
            child: Center(child: Text('No data')),
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
                  // BlocBuilder<BlogUserBloc, BlogUserState>(
                  //   builder: (context, blogUserState) {
                  //     if (blogUserState is BlogUserLoading) {
                  //       return Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     } else if (blogUserState is BlogUserSuccess) {
                  //       print(blogUserState.blogsUser.blogs!.length);
                  //       return Expanded(
                  //         child: ListView.builder(
                  //           controller: scrollController,
                  //           itemCount:
                  //               blogUserState.blogsUser.blogs!.length,
                  //           itemBuilder: (context, index) {
                  //             return ItemBlog(
                  //               blog: blogUserState.blogsUser.blogs![index],
                  //             );
                  //           },
                  //         ),
                  //       );
                  //     }
                  //     return Center(
                  //       child: Text('No Blogs'),
                  //     );
                  //   },
                  // )
                ],
              ),
            );
          }),
        )
      ],
    ));
  }
}
