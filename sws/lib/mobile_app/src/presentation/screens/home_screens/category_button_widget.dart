import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
  class HomeCategoryButtonWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const HomeCategoryButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
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
      ),
    );
  }
}
