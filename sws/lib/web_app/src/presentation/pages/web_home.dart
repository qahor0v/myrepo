// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_network/image_network.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/shimmers/app_shimmer.dart';
import 'package:sws/web_app/src/presentation/screens/desktop_screens/app_bar.dart';
import 'package:sws/web_app/src/presentation/screens/desktop_screens/home_match_widget.dart';
import 'package:sws/web_app/src/presentation/screens/siderbar.dart';
import 'package:sws/web_app/src/presentation/widgets/focused_wrapper.dart';
import 'package:sws/web_app/src/utils/extensions/get_device_type.dart';

class WebHome extends StatelessWidget {
  const WebHome({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contrains) {
        DeviceType type = getDeviceType(context);
        bool isDesktop = (type == DeviceType.DESKTOP);
        bool isMobile = (type == DeviceType.MOBILE);
        bool isTablet = (type == DeviceType.TABLET);
        return Scaffold(
          drawer: isMobile ? const WebSidebar() : null,
          appBar: isMobile
              ? AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: Colors.black,
                  elevation: 0.0,
                  title: const Text(
                    "Silk Way Sport",
                    style: TextStyle(
                      color: mainColor,
                      fontFamily: fontFamily,
                    ),
                  ),
                )
              : null,
          body: Center(
            child: SizedBox(
              width: isDesktop || isTablet
                  ? 900
                  : MediaQuery.of(context).size.width,
              child: CustomScrollView(
                slivers: [
                  if (isDesktop || isTablet) const WebHomeAppBar(index: 0),
                  
                  if (isDesktop || isTablet) WebHomeMatchWidget(),

                  if (isDesktop || isTablet) WebHomeNewsScreen(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class WebHomeNewsScreen extends StatelessWidget {
  const WebHomeNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      bottom: 8,
                      right: 32,
                    ),
                    child: Text(
                      "Yangiliklar",
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: fontFamily2,
                      ),
                    ),
                  ),
                  ...List.generate(
                    6,
                    (index) {
                      return FocusedWrapper(
                        child: (focused) {
                          return AnimatedScale(
                            scale: focused ? 1.03 : 1.0,
                            duration: Duration(milliseconds: 300),
                            child: Container(
                              height: 116,
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: focused ? darkColor : kDarkColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              margin: EdgeInsets.only(
                                top: index != 0 ? 16 : 0.0,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: ImageNetwork(
                                      image:
                                          "https://championat.uz/upload/storage/758643_220.jpg",
                                      height: 100,
                                      width: 120,
                                      onLoading: AppShimmer(),
                                      onError: Icon(
                                        Icons.image,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  WBox(16.0),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "The news title, or lorem ipsum dolor about in this news. And also another text have. The news title, or lorem ipsum dolor about in this news. And also another text have.",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: fontFamily2,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                        ),
                                        HBox(8.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              IconlyLight.calendar,
                                              size: 20,
                                              color: Colors.grey,
                                            ),
                                            WBox(2.0),
                                            Text(
                                              "2023.07.31 | 22:05",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: fontFamily2,
                                              ),
                                            ),
                                            WBox(8.0),
                                            Spacer(),
                                            Icon(
                                              IconlyLight.message,
                                              size: 20,
                                              color: Colors.grey,
                                            ),
                                            WBox(2.0),
                                            Text(
                                              "221",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: fontFamily2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  HBox(16.0),
                  FocusedWrapper(
                    child: (focused) {
                      return AnimatedScale(
                        scale: focused ? 1.03 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: focused ? darkColor : kDarkColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Barcha yangiliklar",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontFamily,
                                ),
                              ),
                              WBox(8.0),
                              const Icon(
                                IconlyLight.arrow_right_2,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      bottom: 8,
                    ),
                    child: Text(
                      "Saqlangan yangiliklar",
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: fontFamily2,
                      ),
                    ),
                  ),
                  ...List.generate(
                    4,
                    (index) {
                      return FocusedWrapper(
                        child: (focused) {
                          return AnimatedScale(
                            scale: focused ? 1.03 : 1.0,
                            duration: Duration(milliseconds: 300),
                            child: Container(
                              height: 116,
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: focused ? darkColor : kDarkColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              margin: EdgeInsets.only(
                                top: index != 0 ? 16 : 0.0,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: ImageNetwork(
                                      image:
                                          "https://championat.uz/upload/storage/758643_220.jpg",
                                      height: 100,
                                      width: 120,
                                      onLoading: AppShimmer(),
                                      onError: Icon(
                                        Icons.image,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  WBox(16.0),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "The news title, or lorem ipsum dolor about in this news. And also another text have. The news title, or lorem ipsum dolor about in this news. And also another text have.",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: fontFamily2,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                        ),
                                        HBox(8.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              IconlyLight.calendar,
                                              size: 20,
                                              color: Colors.grey,
                                            ),
                                            WBox(2.0),
                                            Text(
                                              "2023.07.31 | 22:05",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: fontFamily2,
                                              ),
                                            ),
                                            WBox(8.0),
                                            Spacer(),
                                            Icon(
                                              IconlyLight.message,
                                              size: 20,
                                              color: Colors.grey,
                                            ),
                                            WBox(2.0),
                                            Text(
                                              "221",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: fontFamily2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  HBox(16.0),
                  FocusedWrapper(
                    child: (focused) {
                      return AnimatedScale(
                        scale: focused ? 1.03 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: focused ? darkColor : kDarkColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Barchasi",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontFamily,
                                ),
                              ),
                              WBox(8.0),
                              const Icon(
                                IconlyLight.arrow_right_2,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  HBox(40.0),
                ],
              ),
            ),
            WBox(16.0),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      bottom: 8,
                    ),
                    child: Text(
                      "Tomosha qiling",
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: fontFamily2,
                      ),
                    ),
                  ),
                  ...List<Widget>.generate(4, (index) {
                    return FocusedWrapper(
                      child: (focused) {
                        return AnimatedScale(
                          scale: focused ? 1.03 : 1.0,
                          duration: Duration(milliseconds: 300),
                          child: Container(
                            margin: EdgeInsets.only(
                              top: index != 0 ? 16 : 0.0,
                            ),
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: focused ? darkColor : kDarkColor,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 150,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: ImageNetwork(
                                          image:
                                              "https://championat.uz/upload/storage/758643_220.jpg",
                                          height: 150,
                                          width: 500,
                                          onLoading: AppShimmer(),
                                          onError: Icon(
                                            Icons.image,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Icon(
                                          IconlyLight.play,
                                          color: mainColor,
                                          size: 32,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                HBox(8.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      IconlyLight.video,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    WBox(2.0),
                                    Text(
                                      "07:21",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: fontFamily2,
                                      ),
                                    ),
                                    WBox(8.0),
                                    Spacer(),
                                    Icon(
                                      IconlyLight.calendar,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    WBox(2.0),
                                    Text(
                                      "2023.07.31 | 22:05",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: fontFamily2,
                                      ),
                                    ),
                                  ],
                                ),
                                HBox(8.0),
                                Text(
                                  "The news title, or lorem ipsum dolor about in this news. And also another text have. The news title, or lorem ipsum dolor about in this news. And also another text have.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: fontFamily2,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                  HBox(16.0),
                  FocusedWrapper(
                    child: (focused) {
                      return AnimatedScale(
                        scale: focused ? 1.03 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: focused ? darkColor : kDarkColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ko'proq videolar",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontFamily,
                                ),
                              ),
                              WBox(8.0),
                              const Icon(
                                IconlyLight.arrow_right_2,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      bottom: 8,
                    ),
                    child: Text(
                      "Saqlangan videolar",
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: fontFamily2,
                      ),
                    ),
                  ),
                  ...List<Widget>.generate(3, (index) {
                    return FocusedWrapper(
                      child: (focused) {
                        return AnimatedScale(
                          scale: focused ? 1.03 : 1.0,
                          duration: Duration(milliseconds: 300),
                          child: Container(
                            margin: EdgeInsets.only(
                              top: index != 0 ? 16 : 0.0,
                            ),
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: focused ? darkColor : kDarkColor,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 150,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: ImageNetwork(
                                          image:
                                              "https://championat.uz/upload/storage/758643_220.jpg",
                                          height: 150,
                                          width: 500,
                                          onLoading: AppShimmer(),
                                          onError: Icon(
                                            Icons.image,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Icon(
                                          IconlyLight.play,
                                          color: mainColor,
                                          size: 32,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                HBox(8.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      IconlyLight.video,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    WBox(2.0),
                                    Text(
                                      "07:21",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: fontFamily2,
                                      ),
                                    ),
                                    WBox(8.0),
                                    Spacer(),
                                    Icon(
                                      IconlyLight.calendar,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    WBox(2.0),
                                    Text(
                                      "2023.07.31 | 22:05",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: fontFamily2,
                                      ),
                                    ),
                                  ],
                                ),
                                HBox(8.0),
                                Text(
                                  "The news title, or lorem ipsum dolor about in this news. And also another text have. The news title, or lorem ipsum dolor about in this news. And also another text have.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: fontFamily2,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                  HBox(16.0),
                  FocusedWrapper(
                    child: (focused) {
                      return AnimatedScale(
                        scale: focused ? 1.03 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: focused ? darkColor : kDarkColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Barchasi",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontFamily,
                                ),
                              ),
                              WBox(8.0),
                              const Icon(
                                IconlyLight.arrow_right_2,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  HBox(40.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
