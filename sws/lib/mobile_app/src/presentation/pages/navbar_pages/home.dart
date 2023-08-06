import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sws/mobile_app/src/presentation/pages/navbar_pages/competitions_page.dart';
import 'package:sws/mobile_app/src/presentation/pages/navbar_pages/home_page.dart';
import 'package:sws/mobile_app/src/presentation/pages/navbar_pages/news_page.dart';
import 'package:sws/mobile_app/src/presentation/pages/navbar_pages/tv_page.dart';
import 'package:sws/mobile_app/src/presentation/screens/navbar_screen.dart';

class Home extends StatefulHookConsumerWidget {
  static const String id = 'home';
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home>
    with AutomaticKeepAliveClientMixin<Home> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final controller = usePageController();
    final page = useState<int>(0);
    final x = useState<double>(-0.7);
    final y = useState<double>(-0.99);
    final showBall = useState(false);
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          page.value = index;
          if (index == 0) {
            showBall.value = true;
            x.value = -0.72;
          } else if (index == 1) {
            showBall.value = true;
            x.value = -0.2;
          } else if (index == 2) {
            showBall.value = true;
            x.value = 0.32;
          } else if (index == 3) {
            showBall.value = true;
            x.value = 0.75;
          }
        },
        children: const [
          HomePage(),
          NewsPage(),
          CompetitionsPage(),
          TVPage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: NavBar(
        controller: controller,
        page: page,
        showBall: showBall,
        x: x,
        y: y,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
