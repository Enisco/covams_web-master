import 'package:covams_web/access%20pages/loggedin%20components/loggedin_drawer.dart';
import 'package:covams_web/blocs/logintype_index.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:covams_web/homepage%20building%20blocks/bottom_section.dart';
import 'package:covams_web/homepage%20building%20blocks/covam_drawer.dart';
import 'package:covams_web/homepage%20building%20blocks/hosts_carousels.dart';
import 'package:covams_web/homepage%20building%20blocks/partners_carousels.dart';
import 'package:flutter/material.dart';
import '../homepage building blocks/featured_heading.dart';
import '../homepage building blocks/featured_tiles.dart';
import '../homepage building blocks/floating_text.dart';
import '../homepage building blocks/host_partners_heading.dart';
import '../homepage building blocks/web_scrollbar.dart';
import '../utilities/responsive.dart';
import '../homepage building blocks/top_bar_contents.dart';
import '../main.dart';

class CovamsHomePage extends StatefulWidget {
  const CovamsHomePage({Key? key}) : super(key: key);

  @override
  State<CovamsHomePage> createState() => _CovamsHomePageState();
}

class _CovamsHomePageState extends State<CovamsHomePage> {
  late ScrollController _scrollController;
  double _opacity = 0.0, _scrollPosition = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollPosition = _scrollController.offset;
        });
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // _opacity = colorTopBarBackground ? 0.8 : 0.3;
    _opacity = _scrollPosition >= size.height * 0.40 ? 0.8 : 0.3;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.brightness_6),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(
                      () {
                        MyApp.themeNotifier.value =
                            MyApp.themeNotifier.value == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light;
                      },
                    );
                  },
                ),
              ],
              title: Text(
                'CoVaMS',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(size.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: loginInt == 0 ? const CovamDrawer() : const LoggedInDrawer(),
      //-----------------------------------------------------------------------------

      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: size.height * 0.45,
                    width: size.width,
                    child: Image.asset(
                      'images/Vaccines three.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      //----------------------------------------------------------------

                      FloatingTitleBar(screenSize: size),
                      FeaturedHeading(
                        screenSize: size,
                      ),
                      FeaturedTiles(screenSize: size),
                      const Spacer3(),
                      //----------------------------------------------------------------

                      HostMinistriesHeading(screenSize: size),
                      const Spacer3(),
                      const HostMinistriesCarousel(),
                      const Spacer5(),
                      PartnersHeading(screenSize: size),
                      const Spacer3(),
                      const PartnersCarousel(),
                      const Spacer5(),
                    ],
                  ),
                ],
              ),
              const BottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}
