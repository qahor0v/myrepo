import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/standing_model/standing.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/shimmers/app_shimmer.dart';

class ClubStandingScreen extends StatelessWidget {
  final Standing standing;

  const ClubStandingScreen({
    super.key,
    required this.standing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              ///10
              SizedBox(
                width: 24,
                child: Center(
                  child: Text(
                    standing.overall_league_position,
                    style: GoogleFonts.ubuntu(
                      color: mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              WBox(16.0),

              ///24
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: CachedNetworkImage(
                  imageUrl: standing.team_badge,
                  height: 24,
                  width: 24,
                  fit: BoxFit.cover,
                  placeholder: (s, m) {
                    return const AppShimmer();
                  },
                  errorWidget: (e, m, n) {
                    return const Icon(
                      Icons.sports_soccer,
                      color: Colors.white,
                    );
                  },
                ),
              ),
              WBox(16.0),

              ///160
              SizedBox(
                width: 150,
                child: Text(
                  standing.team_name,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                ),
              ),
              WBox(24.0),
              SizedBox(
                width: 32,
                child: Center(
                  child: Text(
                    standing.overall_league_PTS,
                    style: GoogleFonts.oswald(
                      color: Colors.white,
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
                    standing.overall_league_payed,
                    style: GoogleFonts.oswald(
                      color: Colors.white,
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
                    standing.overall_league_W,
                    style: GoogleFonts.oswald(
                      color: Colors.white,
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
                    standing.overall_league_L,
                    style: GoogleFonts.oswald(
                      color: Colors.white,
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
                    standing.overall_league_D,
                    style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
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
      ),
    );
  }
}
