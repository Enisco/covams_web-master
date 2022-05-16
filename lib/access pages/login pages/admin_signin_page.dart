// ignore_for_file: avoid_print, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covams_web/access%20pages/loggedin%20components/loggedin_drawer.dart';
import 'package:covams_web/access%20pages/stakeholders%20pages/admin_page.dart';
import 'package:covams_web/blocs/appbar_string_bloc.dart';
import 'package:covams_web/blocs/login_state_bloc.dart';
import 'package:covams_web/blocs/login_string_bloc.dart';
import 'package:covams_web/blocs/logintype_index.dart';
import 'package:flutter/material.dart';
import 'package:covams_web/components/buttons.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:covams_web/homepage%20building%20blocks/web_scrollbar.dart';
import 'package:covams_web/main.dart';
import 'package:covams_web/utilities/responsive.dart';
import 'package:covams_web/homepage%20building%20blocks/bottom_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../homepage building blocks/floating_text.dart';
import '../../homepage building blocks/top_bar_contents.dart';

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
String errorMessage = '';

class AdminSignInPage extends StatefulWidget {
  const AdminSignInPage({Key? key}) : super(key: key);

  @override
  _AdminSignInPageState createState() => _AdminSignInPageState();
}

class _AdminSignInPageState extends State<AdminSignInPage> {
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

    return BlocBuilder<LoginStateBloc, int>(builder: (context, state) {
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
                        const Spacer2(),
                        const AdminSignIn(),
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
    });
  }
}

class AdminSignIn extends StatefulWidget {
  const AdminSignIn({Key? key}) : super(key: key);

  @override
  State<AdminSignIn> createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  bool _isObscure = true;

  _incompleteCredentialsAlert(context) {
    Alert(
      context: context,
      title: "ERROR",
      desc: "Enter both username and password",
    ).show();
  }

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
            "Sign In as an Administrator",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: ResponsiveWidget.isSmallScreen(context)
                  ? size.width / 20
                  : size.width / 60,
              fontWeight: FontWeight.bold,
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
                fontSize: ResponsiveWidget.isSmallScreen(context)
                    ? size.width / 25
                    : size.width / 70,
                // color: Colors.black38,
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
                obscureText: _isObscure,
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
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          _isObscure = !_isObscure;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          //---------------------------------------------------------------------------------------------------------

          const Spacer1(),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: size.height / 10, maxWidth: size.width / 2),
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.red, fontSize: size.height / 40),
              ),
            ),
          ),
          //---------------------------------------------------------------------------------------------------------

          const Spacer2(),
          SignInButton(
            pressed: () async {
              if (usernameController.text == '' ||
                  passwordController.text == '') {
                print('Enter both username and password');
                if (mounted) {
                  setState(() {
                    errorMessage = 'Enter both username and password';
                  });
                }
                _incompleteCredentialsAlert(context);
              } else {
                adminLoginAction();
              }
            },
          ),
          const Spacer1(),
          //---------------------------------------------------------------------------------------------------------
        ],
      ),
    );
  }

  void adminLoginAction() async {
    String password = passwordController.text;
    String readPassword, readAccountType;
    String accountType = "Admin";

    final docSnapShot = await FirebaseFirestore.instance
        .collection("covamsdata")
        .doc(usernameController.text)
        .get();
    if (docSnapShot.exists) {
      readPassword = docSnapShot.data()!["Password"].toString();
      readAccountType = docSnapShot.data()!["Account Type"].toString();

      print(readPassword);
      print(readAccountType);

      if (readPassword == password && readAccountType == accountType) {
        print('Password matches: ${docSnapShot.data()!["Password"]}');
        loginString = usernameController.text;
        loginInt = 1;
        appbarString = "Admin";
        print('$loginInt :' + appbarString);

        if (mounted) {
          setState(() {
            errorMessage = '';
            usernameController.text = '';
            passwordController.text = '';
          });
        }

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const AdminPage()),
            (Route<dynamic> route) => false);
      } else {
        _userNotFoundAlert(context);
        print('Username or password Incorrect');
        if (mounted) {
          setState(() {
            errorMessage = 'Username or password Incorrect';
          });
        }
      }

      if (docSnapShot.data() == null) {
        _userNotFoundAlert(context);
        print('Username or password Incorrect');
        if (mounted) {
          setState(() {
            errorMessage = 'Username or password Incorrect';
          });
        }
      }
    } else {
      _userNotFoundAlert(context);
      print('Username or password Incorrect');
      if (mounted) {
        setState(() {
          errorMessage = 'Username or password Incorrect';
        });
      }
    }
  }

  _userNotFoundAlert(context) {
    Alert(
      context: context,
      title: "ERROR",
      desc: "User not found",
    ).show();
  }
}
