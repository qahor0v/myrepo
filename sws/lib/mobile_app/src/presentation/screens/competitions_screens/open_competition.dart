import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/presentation/screens/competitions_screens/competition_matches.dart';
import 'package:sws/mobile_app/src/presentation/screens/competitions_screens/league_table_screen.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';

class OpenCompetitionPage extends HookConsumerWidget {
  final String id;

  const OpenCompetitionPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, ref) {
    final index = useState(0);
    final controller = usePageController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HBox(8.0),
            SizedBox(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        index.value = 0;
                        controller.jumpToPage(0);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 16,
                          right: 8,
                        ),
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: index.value == 0 ? mainColor : darkColor,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            "Turnir jadvali",
                            style: GoogleFonts.roboto(
                              color:
                                  index.value == 0 ? mainColor : Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        index.value = 1;
                        controller.jumpToPage(1);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 16,
                          right: 8,
                        ),
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: index.value == 1 ? mainColor : darkColor,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            "O'yinlar",
                            style: GoogleFonts.roboto(
                              color:
                                  index.value == 1 ? mainColor : Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            HBox(8.0),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (int i) {
                  index.value = i;
                },
                children: [
                  LeagueTableScreen(
                    id: id,
                  ),
                  CompetitionEvents(id: id),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
