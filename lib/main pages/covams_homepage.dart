import 'package:covams_web/components/my_spacers.dart';
import 'package:covams_web/homepage%20building%20blocks/bottom_section.dart';
import 'package:flutter/material.dart';
import '../homepage building blocks/featured_heading.dart';
import '../homepage building blocks/featured_tiles.dart';
import '../homepage building blocks/floating_text.dart';
import '../homepage building blocks/host_partners_heading.dart';
import '../homepage building blocks/host_partners_carousel.dart';
import '../homepage building blocks/web_scrollbar.dart';
import '../homepage building blocks/covams_drawer.dart';
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
  double _scrollPosition = 0;
  double _opacity = 0.0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    //   _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _opacity = _scrollPosition < size.height * 0.40
        ? _scrollPosition / (size.height * 0.40)
        : 1;

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
                    setState(() {
                      MyApp.themeNotifier.value =
                          MyApp.themeNotifier.value == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                    });
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
      drawer: const ExploreDrawer(),
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
                      const Spacer4(),
                      //----------------------------------------------------------------

                      HostMinistriesHeading(screenSize: size),
                      SizedBox(height: size.height / 10),
                      const HostMinistriesCarousel(),
                      PartnersHeading(screenSize: size),
                      SizedBox(height: size.height / 10),
                      const PartnersCarousel(),
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
