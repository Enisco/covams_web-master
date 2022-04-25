// ignore_for_file: avoid_print

import 'package:covams_web/homepage%20building%20blocks/covams_drawer.dart';
import 'package:covams_web/homepage%20building%20blocks/web_scrollbar.dart';
import 'package:covams_web/main.dart';
import 'package:covams_web/utilities/responsive.dart';
import 'package:flutter/material.dart';
import 'package:covams_web/components/buttons.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:covams_web/homepage%20building%20blocks/bottom_section.dart';
import '../../homepage building blocks/floating_text.dart';
import '../../homepage building blocks/top_bar_contents.dart';

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class VerifCentreSignInPage extends StatefulWidget {
  const VerifCentreSignInPage({Key? key}) : super(key: key);

  @override
  _VerifCentreSignInPageState createState() => _VerifCentreSignInPageState();
}

class _VerifCentreSignInPageState extends State<VerifCentreSignInPage> {
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
                      const Spacer2(),
                      const VerifCentreSignIn(),
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

class VerifCentreSignIn extends StatefulWidget {
  const VerifCentreSignIn({Key? key}) : super(key: key);

  @override
  State<VerifCentreSignIn> createState() => _VerifCentreSignInState();
}

class _VerifCentreSignInState extends State<VerifCentreSignIn> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 1.5,
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: size.width / 14, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer2(),
          Text(
            "Sign In as a Verification Centre",
            style: TextStyle(
              fontFamily: 'Poppins',
              // color: Colors.black,
fontSize:  ResponsiveWidget.isSmallScreen(context)
          ? size.width / 20: size.width / 60,              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.height / 140,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: size.height / 20,
              maxWidth: size.width,
            ),
            child: Text(
              "Welcome Back! Enter your details to continue",
              style: TextStyle(
                fontFamily: 'Poppins',
fontSize:  ResponsiveWidget.isSmallScreen(context)
          ? size.width / 25: size.width / 70,                // color: Colors.black38,
              ),
            ),
          ),
          //---------------------------------------------------------------------------------------------------------

          const Spacer3(),
          //---------------------------------------------------------------------------------------------------------

          Center(
            child: SizedBox(
              width: size.width * 0.75,
              height: size.height / 11,
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.tealAccent,
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.blueGrey[600]),
                  fillColor: Colors.white,
                  hintText: 'Enter your username or email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusColor: Colors.blueGrey,
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                ),
              ),
            ),
          ),
          const Spacer2(),
          Center(
            child: SizedBox(
              width: size.width * 0.75,
              height: size.height / 11,
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.tealAccent,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.blueGrey[600]),
                  fillColor: Colors.white,
                  hintText: 'Enter your Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusColor: Colors.blueGrey,
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                ),
              ),
            ),
          ),
          //---------------------------------------------------------------------------------------------------------


          const Spacer4(),
          const SignInButton(pressed: verifCentLoginAction),
          const Spacer1(),
          //---------------------------------------------------------------------------------------------------------
        ],
      ),
    );
  }
}

void verifCentLoginAction() {}
