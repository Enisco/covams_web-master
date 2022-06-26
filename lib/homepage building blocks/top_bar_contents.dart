import 'package:covams_web/main%20pages/covams_homepage.dart';
import 'package:flutter/material.dart';
import '../access pages/login pages/login_gateway.dart';
import 'package:covams_web/main pages/about_us.dart';
import '../main pages/dashboard.dart';
import '../main.dart';

// String topBarString = 'My Account';

class TopBarContents extends StatefulWidget {
  final double opacity;

  const TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(size.width, 1000),
      child: Container(
        color: Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
        // color: Theme.of(context).bottomAppBarColor.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width / 7,
                child: const Text(
                  'CoVaMS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3,
                  ),
                ),
              ),
              //------------------------------------------------------------------------------------------

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //--------------------------------------------------------------------------------

                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[0] = true : _isHovering[0] = false;
                      });
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CovamsHomePage()),
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
                        const SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[0],
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
                        value ? _isHovering[1] = true : _isHovering[1] = false;
                      });
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dashboard()),
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
                        value ? _isHovering[2] = true : _isHovering[2] = false;
                      });
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Aboutpage()),
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
                ],
              ),
              //--------------------------------------------------------------------------------

              Container(
                width: size.width / 7,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    //---------------------------------------------------------------------

                    Container(
                      padding: EdgeInsets.fromLTRB(
                          size.width / 90, 10, size.width / 90, 5),
                      color: Colors.blueGrey[900],
                      child: InkWell(
                        onHover: (value) {
                          setState(
                            () {
                              value
                                  ? _isHovering[3] = true
                                  : _isHovering[3] = false;
                            },
                          );
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginGateway()),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'My Account',
                              style: TextStyle(
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
                    //---------------------------------------------------------------------

                    // TextButton(
                    //   onHover: (value) {
                    //     setState(() {
                    //       value
                    //           ? _isHovering[3] = true
                    //           : _isHovering[3] = false;
                    //     });
                    //   },
                    //   child: Container(
                    //     color: Colors.black45,
                    //     width: size.width / 12,
                    //     height: size.height / 23,
                    //     child: Center(
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           const SizedBox(
                    //             height: 3,
                    //             width: 2,
                    //           ),
                    //           Text(
                    //             topBarString,
                    //             style: TextStyle(
                    //               color: _isHovering[3]
                    //                   ? Colors.blue[200]
                    //                   : Colors.white,
                    //             ),
                    //           ),
                    //           const SizedBox(height: 5),
                    //           Visibility(
                    //             maintainAnimation: true,
                    //             maintainState: true,
                    //             maintainSize: true,
                    //             visible: _isHovering[3],
                    //             child: Container(
                    //               height: 2,
                    //               width: 20,
                    //               color: Colors.white,
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const LoginGateway()),
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
