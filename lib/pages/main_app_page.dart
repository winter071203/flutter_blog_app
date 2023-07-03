import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/models/auth_model.dart';
import 'package:blog_app/models/user_model.dart';
import 'package:blog_app/pages/add_blog_page.dart';
import 'package:blog_app/pages/category_page.dart';
import 'package:blog_app/pages/home_page.dart';
import 'package:blog_app/pages/profile_page.dart';
import 'package:blog_app/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';



class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    /// Dont't forget this
    super.build(context);

    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}


class MainAppPage extends StatefulWidget {
  static const String routeName = '/main_app_page';
  final AuthModel authModel;
  const MainAppPage({super.key, required this.authModel});

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  final PageController  _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
        children: widget.authModel.user?.role == 'admin' ?  [
          KeepAlivePage(child: HomePage(user: widget.authModel.user as UserModel)),
          SearchPage(),
          KeepAlivePage(child: CategoryPage()),
          KeepAlivePage(
            child: ProfilePage(
              authModel: widget.authModel,
            ),
          )
        ]
        :[
          KeepAlivePage(child: HomePage(user: widget.authModel.user as UserModel)),
          SearchPage(),
          KeepAlivePage(
            child: ProfilePage(
              authModel: widget.authModel,
            ),
          )
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.5),
        margin: EdgeInsets.symmetric(
            horizontal: kMediumPadding, vertical: kDefaultPadding),
        items: widget.authModel.user?.role == 'admin' ?  [
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              size: kDefaultPadding,
            ),
            title: Text('Home'),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.searchengin,
              size: kDefaultPadding,
            ),
            title: Text('Search'),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.bars,
              size: kDefaultPadding,
            ),
            title: Text('Category'),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.solidUser,
              size: kDefaultPadding,
            ),
            title: Text('Profile'),
          ),
        ]
        :
        [
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              size: kDefaultPadding,
            ),
            title: Text('Home'),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.searchengin,
              size: kDefaultPadding,
            ),
            title: Text('Search'),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.solidUser,
              size: kDefaultPadding,
            ),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
