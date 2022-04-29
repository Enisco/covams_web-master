// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covams_web/access%20pages/loggedin%20components/loggedin_drawer.dart';
import 'package:covams_web/access%20pages/stakeholders%20pages/user_page.dart';
import 'package:covams_web/blocs/appbar_string_bloc.dart';
import 'package:covams_web/blocs/login_string_bloc.dart';
import 'package:covams_web/blocs/logintype_index.dart';
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
String errorMessage = '';

class UserSignInPage extends StatefulWidget {
  const UserSignInPage({Key? key}) : super(key: key);

  @override
  _UserSignInPageState createState() => _UserSignInPageState();
}

class _UserSignInPageState extends State<UserSignInPage> {
  late ScrollController _scrollController;
  final double _scrollPosition = 0;
  double _opacity = 0.0;


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
                      const Spacer2(),
                      const UserSignIn(),
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

class UserSignIn extends StatefulWidget {
  const UserSignIn({Key? key}) : super(key: key);

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
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
            "Sign In",
            style: TextStyle(
              fontFamily: 'Poppins',
              // color: Colors.black,
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
                    : size.width / 70, // color: Colors.black38,
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
                // cursorColor: Colors.tealAccent,
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

          const Spacer4(),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: size.height / 10, maxWidth: size.width / 1.5),
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.red, fontSize: size.width / 40),
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
                setState(() {
                  errorMessage = 'Enter both username and password';
                });
              } else {
                userLoginAction();
              }
            },
          ),
          const Spacer1(),
          //---------------------------------------------------------------------------------------------------------
        ],
      ),
    );
  }

  void userLoginAction() async {
    String password = passwordController.text;
    String readPassword, readAccountType;
    String accountType = "User";

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
        loginString = docSnapShot.data()!["First Name"].toString();
        // String loginID = usernameController.text;
        loginString = usernameController.text;
        loginInt = 4;
        appbarString =
            docSnapShot.data()!["Vaccination Centre Name"].toString();
        print('$loginInt :' + appbarString);

        setState(() {
          errorMessage = '';
          usernameController.text = '';
          passwordController.text = '';
        });
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => UserPage(
                      userUniqueID: loginString,
                    )),
            (Route<dynamic> route) => false);
      } else {
        print('Password doesn\'t  match: ${docSnapShot.data()!["Password"]}');
        print('Username or password Incorrect');
        setState(() {
          errorMessage = 'Username or password Incorrect';
        });
      }

      if (docSnapShot.data() == null) {
        print('User not found');
        print('Username or password Incorrect');
        setState(() {
          errorMessage = 'Username or password Incorrect';
        });
      }
    } else {
      print('Username or password Incorrect');
      setState(() {
        errorMessage = 'Username or Password Incorrect';
      });
    }
  }
}
