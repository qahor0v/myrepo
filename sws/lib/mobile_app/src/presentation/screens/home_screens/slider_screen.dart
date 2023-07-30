import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';

class HomeSliderScreen extends StatelessWidget {
  const HomeSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enableInfiniteScroll: true,
          height: 180.0,
          viewportFraction: 0.8,
        ),
        items: List<Widget>.generate(
          6,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    'https://i2-prod.mirror.co.uk/incoming/article30508791.ece/ALTERNATES/s1200/0_Arsenal-FC-v-MLS-All-Stars-2023-MLS-All-Star-Game.jpg',
                imageBuilder: (context, imageProvider) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.transparent,
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "The news title, lorem ipsum",
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            );
          },
        ),
      ),
    );
  }
}
