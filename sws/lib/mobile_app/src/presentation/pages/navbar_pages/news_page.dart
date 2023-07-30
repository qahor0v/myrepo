import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/shimmers/app_shimmer.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OpenNewsPage();
    // return SafeArea(
    //   child: Scaffold(
    //     body: Padding(
    //       padding: const EdgeInsets.only(left: 16, right: 16),
    //       child: CustomScrollView(
    //         slivers: [
    //           const NewsPageTitle(title: "Eng ko'p o'qilgan"),
    //           const HomeSliderScreen(),
    //           SBox(8.0),
    //           const NewsPageTitle(title: "So'nggi yangiliklar"),
    //           const HomeNewsWidget(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class NewsPageTitle extends StatelessWidget {
  final String title;

  const NewsPageTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Text(
          title,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class OpenNewsPage extends HookConsumerWidget {
  const OpenNewsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final liked = useState(false);
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        liked.value = !liked.value;
                      },
                      icon: Icon(
                        liked.value ? Icons.favorite : Icons.favorite_border,
                        color: liked.value ? mainColor : Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 8.0,
                ),
                child: Text(
                  "The News Title. For example, lorem ipsum dolor",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SBox(8.0),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: 200,
                  imageUrl:
                      "https://firebasestorage.googleapis.com/v0/b/metr-uz.appspot.com/o/mb.jpg?alt=media&token=bb375090-9494-44d5-971b-5d60b7eb171e",
                  placeholder: (c, u) {
                    return const AppShimmer();
                  },
                ),
              ),
            ),
            SliverList(

              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column();
                },
                childCount: 4
              ),
            ),


          ],
        ),
      ),
    );
  }
}
