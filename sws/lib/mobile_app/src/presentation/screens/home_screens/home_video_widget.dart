import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/shimmers/app_shimmer.dart';

class HomeVideoWidget extends StatelessWidget {
  const HomeVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 6,
        (context, index) {
          return Container(
            margin: const EdgeInsets.only(
              top: 4.0,
              bottom: 8.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: kDarkColor,
            ),
            height: 120,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://www.realmadrid.com/img/cc_1920px/_1vc0209_20230719021253.jpg",

                          placeholder: (context, url) {
                            return const AppShimmer();
                          },
                          // errorWidget: (context, e, b){
                          //   return ErrorHint(message);
                          // },
                        ),
                      ),
                      const Center(
                        child: Icon(
                          IconlyBold.play,
                          color: mainColor,
                          size: 36,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "The news title, lorem ipsum, dolor. Real Madrid players lorem ipsum",
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 4,
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          children: [
                            const Icon(
                              IconlyLight.calendar,
                              color: Colors.grey,
                              size: 20,
                            ),
                            WBox(2.0),
                            Text(
                              "21:00 / 21.07.2023",
                              style: GoogleFonts.inter(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
