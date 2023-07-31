// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_network/image_network.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/presentation/providers/soccer_providers.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/error_screen.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/loading_screen.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/shimmers/app_shimmer.dart';
import 'package:sws/web_app/src/presentation/screens/desktop_screens/app_bar.dart';
import 'package:sws/web_app/src/presentation/screens/siderbar.dart';
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
                  ? 800
                  : MediaQuery.of(context).size.width,
              child: CustomScrollView(
                slivers: [
                  if (isDesktop || isTablet) const WebHomeAppBar(),
                  if (isDesktop || isTablet) WebHomeMatchWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class WebHomeMatchWidget extends HookConsumerWidget {
  const WebHomeMatchWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final getter = ref.watch(getAllEventsProvider);
    return SliverToBoxAdapter(
      child: getter.when(
        data: (data) {
          return Row(
            children: [
              Expanded(
                  child: Column(
                children: List<Widget>.generate(data.length - data.length ~/ 2,
                    (index) {
                  final event = data[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: darkColor,
                    ),
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 8,
                      bottom: 8,
                    ),
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  event.match_hometeam_name.trim(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: fontFamily2,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              WBox(8.0),
                              ClipRRect(
                                child: ImageNetwork(
                                  image: event.team_home_badge,
                                  height: 30,
                                  width: 30,
                                  onError: Icon(
                                    Icons.sports_soccer,
                                    color: Colors.white,
                                  ),
                                  onLoading: AppShimmer(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                child: ImageNetwork(
                                  image: event.team_home_badge,
                                  height: 30,
                                  width: 30,
                                  onError: Icon(
                                    Icons.sports_soccer,
                                    color: Colors.white,
                                  ),
                                  onLoading: AppShimmer(),
                                ),
                              ),
                              WBox(8.0),
                              Expanded(
                                child: Text(
                                  event.match_hometeam_name.trim(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: fontFamily2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              )),
              WBox(24.0),
              Expanded(
                  child: Column(
                children: [],
              ))
            ],
          );
        },
        error: (e, m) {
          return const AppError();
        },
        loading: () {
          return const AppLoading();
        },
      ),
    );
  }
}
