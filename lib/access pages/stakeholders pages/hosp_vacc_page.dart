// ignore_for_file: avoid_print

import 'package:covams_web/access%20pages/data%20addition%20pages/reg_newuser_details.dart';
import 'package:covams_web/access%20pages/loggedin%20components/loggedin_drawer.dart';
import 'package:covams_web/access%20pages/loggedin%20components/top_bar_logged_in.dart';
import 'package:covams_web/homepage%20building%20blocks/covam_drawer.dart';
import 'package:flutter/material.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:covams_web/homepage%20building%20blocks/web_scrollbar.dart';
import 'package:covams_web/main.dart';
import 'package:covams_web/utilities/responsive.dart';
import 'package:covams_web/homepage%20building%20blocks/bottom_section.dart';
import '../../homepage building blocks/floating_text.dart';

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class HospVaccCentPage extends StatefulWidget {
  const HospVaccCentPage({Key? key}) : super(key: key);

  @override
  _HospVaccCentPageState createState() => _HospVaccCentPageState();
}

class _HospVaccCentPageState extends State<HospVaccCentPage> {
  late ScrollController _scrollController;
  final double _scrollPosition = 0;
  double _opacity = 0.0;

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
        // drawer: const CovamDrawer(),
        drawer: const LogInDrawer(),
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
                      const Spacer2(),
                      const RegisterUserDetails(),
                      const Spacer4(),
                      //----------------------------------------------------------------
                      const Spacer4(),
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
