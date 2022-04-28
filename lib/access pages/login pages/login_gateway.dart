// ignore_for_file: unused_element

import 'package:covams_web/access%20pages/loggedin%20components/loggedinDrawer.dart';
import 'package:covams_web/access%20pages/login%20pages/admin_signin_page.dart';
import 'package:covams_web/access%20pages/login%20pages/hospvacc_cent_signin_page.dart';
import 'package:covams_web/access%20pages/login%20pages/user_signin_page.dart';
import 'package:covams_web/access%20pages/login%20pages/verif_cent_signin_page.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:covams_web/homepage%20building%20blocks/covam_drawer.dart';
import 'package:flutter/material.dart';
import 'package:covams_web/homepage%20building%20blocks/bottom_section.dart';
import 'package:covams_web/homepage%20building%20blocks/floating_text.dart';
import 'package:covams_web/homepage%20building%20blocks/web_scrollbar.dart';
import 'package:covams_web/homepage%20building%20blocks/top_bar_contents.dart';
import 'package:covams_web/utilities/responsive.dart';
import 'package:covams_web/main.dart';

class LoginGatewayWidget extends StatelessWidget {
  const LoginGatewayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Log in as:",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: size.height / 43,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer4(),
        //---------------------------------------------------------------------------------

        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AdminSignInPage()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            width: ResponsiveWidget.isSmallScreen(context)
                ? size.width / 1.5
                : size.width / 2.5,
            height: size.height / 18,
            child: Center(
              child: Text(
                "Administrator",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: size.height / 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const Spacer2(),
        //---------------------------------------------------------------------------------

        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HospVaccCentSignInPage()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            width: ResponsiveWidget.isSmallScreen(context)
                ? size.width / 1.5
                : size.width / 2.5,
            height: size.height / 18,
            child: Center(
              child: Text(
                "Vaccination Centres",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: size.height / 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const Spacer2(),
        //---------------------------------------------------------------------------------

        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const VerifCentreSignInPage()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            width: ResponsiveWidget.isSmallScreen(context)
                ? size.width / 1.5
                : size.width / 2.5,
            height: size.height / 18,
            child: Center(
              child: Text(
                "Verification Centres",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: size.height / 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const Spacer2(),
        //---------------------------------------------------------------------------------

        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserSignInPage()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            width: ResponsiveWidget.isSmallScreen(context)
                ? size.width / 1.5
                : size.width / 2.5,
            height: size.height / 18,
            child: Center(
              child: Text(
                "User",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: size.height / 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const Spacer4(),
        //---------------------------------------------------------------------------------
      ],
    );
  }
}
//------------------------------*************************---------------------------------

class LoginGateway extends StatefulWidget {
  const LoginGateway({Key? key}) : super(key: key);

  @override
  _LoginGatewayState createState() => _LoginGatewayState();
}

class _LoginGatewayState extends State<LoginGateway> {
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
                      const Spacer4(),
                      //----------------------------------------------------------------

                      const LoginGatewayWidget(),
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
