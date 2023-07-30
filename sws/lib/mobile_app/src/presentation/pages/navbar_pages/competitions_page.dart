// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sws/mobile_app/src/config/router/navigator.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/presentation/screens/competitions_screens/open_competition.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/utils/constants/score_sources.dart';

class CompetitionsPage extends StatelessWidget {
  const CompetitionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SBox(8.0),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8.0, bottom: 8.0),
                child: Text(
                  "Miiliy chempionatlar",
                  style: GoogleFonts.ubuntu(
                    color: mainColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: Turnir.all.length,
                (c, index) {
                  final title = Turnir.all[index].name;
                  final id = Turnir.all[index].id;
                  return ListTile(
                    onTap: () async {
                      go(context, OpenCompetitionPage(id: id));
                    },
                    leading: ImageIcon(
                      AssetImage("assets/icons/champions.png"),
                      size: 30,
                      color: mainColor.withRed(200),
                    ),
                    title: Text(
                      title,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            SBox(100.0),
          ],
        ),
      ),
    );
  }
}
