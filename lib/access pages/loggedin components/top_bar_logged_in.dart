// ignore_for_file: use_key_in_widget_constructors

import 'package:covams_web/access%20pages/loggedin%20components/loggedin_about_us.dart';
import 'package:covams_web/access%20pages/loggedin%20components/loggedin_dashboard.dart';
import 'package:covams_web/access%20pages/loggedin%20components/loggedin_homepage.dart';
import 'package:covams_web/blocs/appbar_string_bloc.dart';
import 'package:covams_web/blocs/login_state_bloc.dart';
import 'package:covams_web/blocs/login_string_bloc.dart';
import 'package:covams_web/blocs/logintype_index.dart';
import 'package:covams_web/components/constants.dart';
import 'package:covams_web/main%20pages/covams_homepage.dart';
import 'package:covams_web/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// String userSurname = appbarString;

class TopBarLoggedInContent extends StatefulWidget {
  final double opacity;

  const TopBarLoggedInContent(
    this.opacity,
  );

  @override
  State<TopBarLoggedInContent> createState() => _TopBarLoggedInContentState();
}

class _TopBarLoggedInContentState extends State<TopBarLoggedInContent> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<LoginStateBloc, int>(builder: (context, state) {
      return PreferredSize(
        preferredSize: Size(size.width, 1000),
        child: Container(
          color:
              Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'CoVaMS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(width: size.width / 5),
                //-------------------------------------------------------------------

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[0] = true
                                : _isHovering[0] = false;
                          });
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoggedInHomePage()),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Home',
                              style: TextStyle(
                                color: _isHovering[0]
                                    ? Colors.blue[200]
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(width: size.width / 8),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[0],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Colors.white,
                              )
                            )
                          ],
                        ),
                      ),
                      //--------------------------------------------------------------------------------

                      SizedBox(width: size.width / 20),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[1] = true
                                : _isHovering[1] = false;
                          });
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LoggedInDashboard()),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                color: _isHovering[1]
                                    ? Colors.blue[200]
                                    : Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[1],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      //--------------------------------------------------------------------------------

                      SizedBox(width: size.width / 20),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[2] = true
                                : _isHovering[2] = false;
                          });
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LoggedInAboutpage()),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'About',
                              style: TextStyle(
                                color: _isHovering[2]
                                    ? Colors.blue[200]
                                    : Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[2],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      //-----------------------------------------------------------------------
                    ],
                  ),
                ),
                //-----------------------------------------------------------------------

                SizedBox(
                  width: size.width / 50,
                ),

                TextButton(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[3] = true : _isHovering[3] = false;
                    });
                  },
                  child: Container(
                    color: Colors.black45,
                    width: size.width / 12,
                    height: size.height / 23,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 3,
                            width: 2,
                          ),
                          Text(
                            appbarString,
                            style: TextStyle(
                              fontSize: size.width / 90,
                              color: _isHovering[3]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[3],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => accesssPages[loginInt],
                      ),
                    );
                  },
                ),
                //--------------------------------------------------------------------------------

                SizedBox(width: size.width / 20),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[4] = true : _isHovering[4] = false;
                    });
                  },
                  onTap: () {
                    loginInt = 0;
                    loginString = '';
                    appbarString = 'My Account';

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const CovamsHomePage()),
                        (Route<dynamic> route) => false);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Log Out',
                        style: TextStyle(
                          color:
                              _isHovering[4] ? Colors.blue[200] : Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[4],
                        child: Container(
                          height: 2,
                          width: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                //-----------------------------------------------------------------------

                IconButton(
                  icon: Icon(
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Colors.white,
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
            ),
          ),
        ),
      );
    });
  }
}

// class MyPage extends StatelessWidget {
//   MyPage({Key? key, required this.mypage}) : super(key: key);

//   Widget mypage;

//   @override
//   Widget build(BuildContext context) {
//     return mypage;
//   }
// }
