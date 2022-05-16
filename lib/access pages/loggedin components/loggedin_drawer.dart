// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:covams_web/access%20pages/loggedin%20components/loggedin_about_us.dart';
import 'package:covams_web/access%20pages/loggedin%20components/loggedin_dashboard.dart';
import 'package:covams_web/access%20pages/loggedin%20components/loggedin_homepage.dart';
import 'package:covams_web/blocs/appbar_string_bloc.dart';
import 'package:covams_web/blocs/login_string_bloc.dart';
import 'package:covams_web/blocs/logintype_index.dart';
import 'package:covams_web/components/constants.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:covams_web/main%20pages/covams_homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInDrawer extends StatefulWidget {
  const LogInDrawer({Key? key}) : super(key: key);

  @override
  State<LogInDrawer> createState() => _LogInDrawerState();
}

class _LogInDrawerState extends State<LogInDrawer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _drawerHeader(),
          const Spacer2(),
          _HomeDrawerItem(),
          _DashboardDrawerItem(),
          _AboutDrawerItem(),
          _MyAccountDrawerItem(),
          _LogOutDrawerItem(),
          //------------------------------------------------------------

          const Spacer2(),
          Container(
            width: size.width * 0.7,
            height: 1,
            color: Colors.blueGrey,
          ),
          const Spacer2(),
          const Center(
            child: Text(
              "© CopyRight | CoVaMS 2022", 
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white54,
                  fontFamily: 'Montserrat'),
            ),
          ),
          const Spacer2(),
          //------------------------------------------------------------
        ],
      ),
    );
  }

  //-------------------------------------------------------------------------------

  Widget _LogOutDrawerItem() {
    return ListTile(
      title: Row(
        children: <Widget>[
          const Icon(Icons.logout_rounded),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Log Out',
              style: TextStyle(
                  color: Colors.blueGrey[100], fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
      onTap: () {
        loginInt = 0;
        loginString = '';
        appbarString = 'My Account';

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const CovamsHomePage()),
            (Route<dynamic> route) => false);
      },
    );
  }
  //-------------------------------------------------------------------------------

  Widget _MyAccountDrawerItem() {
    return ListTile(
      title: Row(
        children: <Widget>[
          const Icon(CupertinoIcons.square_favorites_alt),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              appbarString,
              style: TextStyle(
                  color: Colors.blueGrey[100], fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
      onTap: () {
        print('$loginInt');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => accesssPages[loginInt]),
        );
      },
    );
  }
  //-------------------------------------------------------------------------------

  Widget _AboutDrawerItem() {
    return ListTile(
      title: Row(
        children: <Widget>[
          const Icon(CupertinoIcons.person_2_alt),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'About',
              style: TextStyle(
                  color: Colors.blueGrey[100], fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoggedInAboutpage()),
        );
      },
    );
  }
  //-------------------------------------------------------------------------------

  Widget _DashboardDrawerItem() {
    return ListTile(
      title: Row(
        children: <Widget>[
          const Icon(Icons.dashboard_rounded),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Dashboard',
              style: TextStyle(
                  color: Colors.blueGrey[100], fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoggedInDashboard()),
        );
      },
    );
  }
  //-------------------------------------------------------------------------------

  Widget _HomeDrawerItem() {
    return ListTile(
      title: Row(
        children: <Widget>[
          const Icon(CupertinoIcons.home),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Home',
              style: TextStyle(
                  color: Colors.blueGrey[100], fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
      onTap: () {
        print('$loginInt');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoggedInHomePage()),
        );
      },
    );
  }
  //-------------------------------------------------------------------------------

  Widget _drawerHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/covid_vaccine.jpeg'),
        ),
      ),
      child: Stack(
        children: const <Widget>[
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text(
              "CoVaMS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
