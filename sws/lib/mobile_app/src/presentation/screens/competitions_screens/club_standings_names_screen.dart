import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';

class ClubStandingStatsNameScreen extends StatelessWidget {
  const ClubStandingStatsNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///10
            const SizedBox(
              width: 26,
              child: Center(
                child: Text(
                  "O'",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            WBox(20),

            ///160
            SizedBox(
              width: 170,
              child: Text(
                "Jamoa ",
                style: GoogleFonts.inter(
                  color: mainColor,
                  fontSize: 16,
                ),
                maxLines: 1,
              ),
            ),
            WBox(32.0),
            SizedBox(
              width: 32,
              child: Center(
                child: Text(
                  "O",
                  style: GoogleFonts.oswald(
                      color: mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  maxLines: 1,
                ),
              ),
            ),
            WBox(24.0),
            SizedBox(
              width: 32,
              child: Center(
                child: Text(
                  "O'/S",
                  style: GoogleFonts.oswald(
                    color: mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            WBox(24.0),
            SizedBox(
              width: 32,
              child: Center(
                child: Text(
                  "G'/S",
                  style: GoogleFonts.oswald(
                    color: mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            WBox(24.0),
            SizedBox(
              width: 32,
              child: Center(
                child: Text(
                  "M/S",
                  style: GoogleFonts.oswald(
                    color: mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            WBox(24.0),
            SizedBox(
              width: 32,
              child: Center(
                child: Text(
                  "D/S",
                  style: GoogleFonts.oswald(
                    color: mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
        HBox(8.0),
        const Divider(
          color: Colors.white,
          thickness: 1,
          height: 1,
        ),
      ],
    );
  }
}
