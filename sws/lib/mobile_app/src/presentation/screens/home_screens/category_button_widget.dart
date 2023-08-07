import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';

class HomeCategoryButtonWidget extends HookConsumerWidget {
  final AsyncValue<List> videosProvider;
  final String title;
  final void Function() onTap;

  const HomeCategoryButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.videosProvider,
  });

  @override
  Widget build(BuildContext context, ref) {
    return SliverToBoxAdapter(
      child: videosProvider.when(
        data: (data) {
          if (data.isEmpty) {
            return WBox(0.0);
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Row(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: onTap,
                    child: Row(
                      children: [
                        Text(
                          "Barchasi",
                          style: GoogleFonts.lato(
                            color: mainColor,
                            fontSize: 18,
                          ),
                        ),
                        WBox(4.0),
                        const Icon(
                          Icons.navigate_next_sharp,
                          color: mainColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
        error: (e, m) => WBox(0.0),
        loading: () {
          return WBox(0.0);
        },
      ),
    );
  }
}




