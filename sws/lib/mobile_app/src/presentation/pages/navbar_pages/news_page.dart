// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:sws/mobile_app/src/config/router/navigator.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/presentation/providers/news_providers.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/news_screens/open_news_page.dart';
import 'package:sws/mobile_app/src/presentation/screens/news_screens/top_news.dart';
import 'package:sws/mobile_app/src/presentation/screens/shimmers/app_shimmer.dart';

import '../../../utils/extensions/time_parsers.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HBox(16.0),
                const NewsPageTopScreen(),
                HBox(16.0),
                const NewsPageAllNewsScreen(),
              ],
            ),
          ),
        ),
      ),
    );
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

class NewsPageTopScreen extends HookConsumerWidget {
  const NewsPageTopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.watch(getTopNewsProvider);
    return _provider.when(data: (data) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NewsPageTitle(title: "Eng ko'p o'qilgan"),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (e, index) {
                final news = data[index];
                return GestureDetector(
                  onTap: () {
                    go(context, OpenTopNewsPage(news: news));
                  },
                  child: Container(
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              imageUrl: news.banner,
                              placeholder: (context, url) {
                                return const AppShimmer();
                              },
                              // errorWidget: (context, e, b){
                              //   return ErrorHint(message);
                              // },
                            ),
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
                                  news.title,
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
                                      size: 18,
                                    ),
                                    WBox(2.0),
                                    Text(
                                      "${TimeParser.parse(news.createdTime).time} / ${TimeParser.parse(news.createdTime).date}",
                                      style: GoogleFonts.inter(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      );
    }, error: (e, m) {
      return WBox(0.0);
    }, loading: () {
      return const AppShimmer();
    });
  }
}

class NewsPageAllNewsScreen extends HookConsumerWidget {
  const NewsPageAllNewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.watch(getAllNewsProvider);
    return _provider.when(data: (data) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NewsPageTitle(title: "So'nggi yangiliklar"),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (e, index) {
                final news = data[index];
                return GestureDetector(
                  onTap: () {
                    go(context, OpenNewsPage(news: news));
                  },
                  child: Container(
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              imageUrl: news.banner,
                              placeholder: (context, url) {
                                return const AppShimmer();
                              },
                              // errorWidget: (context, e, b){
                              //   return ErrorHint(message);
                              // },
                            ),
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
                                  news.title,
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
                                      size: 18,
                                    ),
                                    WBox(2.0),
                                    Text(
                                      "${TimeParser.parse(news.createdTime).time} / ${TimeParser.parse(news.createdTime).date}",
                                      style: GoogleFonts.inter(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      );
    }, error: (e, m) {
      return WBox(0.0);
    }, loading: () {
      return const AppShimmer();
    });
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
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        title,
        style: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// class OpenNewsPage extends HookConsumerWidget {
//   const OpenNewsPage({super.key});
//
//   @override
//   Widget build(BuildContext context, ref) {
//     final liked = useState(false);
//     return SafeArea(
//       child: Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const Spacer(),
//                     IconButton(
//                       onPressed: () {
//                         liked.value = !liked.value;
//                       },
//                       icon: Icon(
//                         liked.value ? Icons.favorite : Icons.favorite_border,
//                         color: liked.value ? mainColor : Colors.white,
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.share,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                   left: 16,
//                   right: 16,
//                   bottom: 8.0,
//                 ),
//                 child: Text(
//                   "The News Title. For example, lorem ipsum dolor",
//                   textAlign: TextAlign.left,
//                   style: GoogleFonts.lato(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//             SBox(8.0),
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                   left: 16,
//                   right: 16,
//                 ),
//                 child: CachedNetworkImage(
//                   width: double.infinity,
//                   height: 200,
//                   imageUrl:
//                       "https://firebasestorage.googleapis.com/v0/b/metr-uz.appspot.com/o/mb.jpg?alt=media&token=bb375090-9494-44d5-971b-5d60b7eb171e",
//                   placeholder: (c, u) {
//                     return const AppShimmer();
//                   },
//                 ),
//               ),
//             ),
//             SliverList(
//
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   return Column();
//                 },
//                 childCount: 4
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
