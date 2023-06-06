import 'dart:async';

import 'package:blog_app/constants/color_constants.dart';
import 'package:blog_app/constants/dimension_constants.dart';
import 'package:blog_app/helpers/asset_helper.dart';
import 'package:blog_app/helpers/image_helper.dart';
import 'package:blog_app/pages/login_page.dart';
import 'package:blog_app/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  static const String routeName = '/intro_page';
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildSliderItem(SliderModel slider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: BoxDecoration(
            border: Border.all(color: ColorPalette.dividerColor, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ImageHelper.loadImageAsset(slider.image!, fit: BoxFit.cover, borderRadius: BorderRadius.circular(20))),
        const SizedBox(height: kDefaultPadding),
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            slider.title!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: listSliderData.map((sliderItem) {
                return _buildSliderItem(sliderItem);
              }).toList(),
            ),
            Positioned(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding * 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 6,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: listSliderData.length,
                      effect: const ExpandingDotsEffect(
                        dotHeight: kMinPadding,
                        dotWidth: kMinPadding,
                        activeDotColor: Colors.orange,
                      ),
                    ),
                  ),
                  StreamBuilder<int>(
                    initialData: 0,
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                          flex: 4,
                          child: ButtonWidget(
                              title: snapshot.data != 2 ? 'Next' : 'Get Started',
                              onPressed: () {
                                if (_pageController.page != 2) {
                                  _pageController.nextPage(
                                      duration: const Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                } else {
                                  Get.to(() => LoginPage(), transition: Transition.zoom, duration: Duration(milliseconds: 500));
                                }
                              }));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SliderModel {
  final String? title;
  final String? image;
  const SliderModel({
    required this.title,
    required this.image,
  });
}

List<SliderModel> listSliderData = [
  SliderModel(title: 'Welcome to blog app', image: AssetHelper.imgSlider1),
  SliderModel(title: 'News: Social, City....', image: AssetHelper.imgSlider2),
  SliderModel(
      title: 'Connect with more friends', image: AssetHelper.imgSlider3),
];
