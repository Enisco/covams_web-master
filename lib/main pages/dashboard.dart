import 'package:covams_web/access%20pages/loggedin%20components/loggedin_drawer.dart';
import 'package:covams_web/blocs/logintype_index.dart';
import 'package:covams_web/homepage%20building%20blocks/bottom_section.dart';
import 'package:covams_web/homepage%20building%20blocks/covam_drawer.dart';
import 'package:covams_web/homepage%20building%20blocks/dashboard_elements.dart';
import 'package:flutter/material.dart';
import '../components/my_spacers.dart';
import '../homepage building blocks/floating_text.dart';
import '../homepage building blocks/web_scrollbar.dart';
import '../utilities/responsive.dart';
import '../homepage building blocks/top_bar_contents.dart';
import '../main.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
    // _scrollController.addListener(_scrollListener);
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
      // drawer: const CovamDrawer(),
      // drawer: const LogInDrawer(),
      drawer: loginInt == 0 ? const CovamDrawer() : const LogInDrawer(),
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
                      // DashBoard(screenSize: size),
                      const Spacer4(),
                      //----------------------------------------------------------------

                      Padding(
                        padding: EdgeInsets.all(
                            ResponsiveWidget.isSmallScreen(context)
                                ? (size.width * 0.1)
                                : (size.width * 0.03)),
                        child: const DashboardElements(),
                      ),
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
