// ignore_for_file: unused_element

import 'package:covams_web/access%20pages/loggedin%20components/loggedin_drawer.dart';
import 'package:covams_web/access%20pages/loggedin%20components/top_bar_logged_in.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:covams_web/homepage%20building%20blocks/bottom_section.dart';
import 'package:covams_web/homepage%20building%20blocks/floating_text.dart';
import 'package:covams_web/homepage%20building%20blocks/web_scrollbar.dart';
import 'package:covams_web/main.dart';
import 'package:covams_web/utilities/responsive.dart';
import 'package:flutter/material.dart';

class LoggedInAboutpage extends StatefulWidget {
  const LoggedInAboutpage({Key? key}) : super(key: key);

  @override
  _LoggedInAboutpageState createState() => _LoggedInAboutpageState();
}

class _LoggedInAboutpageState extends State<LoggedInAboutpage> {
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
              child: TopBarLoggedInContent(_opacity),
            ),
      drawer: const LoggedInDrawer(),
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
                      const AboutWidget(),
                      const Spacer4(),
                      //----------------------------------------------------------------
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


class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width / 20, vertical: 10),
      height: size.height / 3,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer2(),
          Text(
            "About us",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: size.height / 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer2(),
          //---------------------------------------------------------------------------------------------------------

          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: size.width,
              maxHeight: ResponsiveWidget.isSmallScreen(context)
                  ? (size.height / 3)
                  : (size.height / 3),
            ),
            child: Wrap(
              children: [
                Text(
                  'The COVID-19 Vaccination Management System (CoVaMS) is a platform '
                  'which serves as a central database where all the details of '
                  'vaccinated citizens are stored for ease of mobile accessibility, '
                  'especially for confirmation and verification at any point of necessity.'
                  'With CoVaMS, the details of a vaccinated citizen can be '
                  'confirmed, tracked and updated with ease.',
                  style: TextStyle(
                    fontSize: ResponsiveWidget.isSmallScreen(context)
                        ? (size.width / 35)
                        : (size.width / 75),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer3(),
          //----------------------------------***************************---------------------------------------------
        ],
      ),
    );
  }
}
