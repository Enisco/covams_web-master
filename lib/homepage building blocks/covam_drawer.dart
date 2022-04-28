// ignore_for_file: non_constant_identifier_names

import 'package:covams_web/access%20pages/login%20pages/login_gateway.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:covams_web/main%20pages/covams_homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main pages/about_us.dart';
import '../main pages/dashboard.dart';

class CovamDrawer extends StatefulWidget {
  const CovamDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _CovamDrawerState createState() => _CovamDrawerState();
}

class _CovamDrawerState extends State<CovamDrawer> {
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
          //------------------------------------------------------------

          const Spacer2(),
          Container(
            width: size.width / 8,
            height: 1,
            color: Colors.blueGrey,
          ),
          const Spacer2(),
          const Center(
            child: Text(
              "© CopyRight 2020 | CoVaMS 2022",
              style: TextStyle(fontSize: 10, fontFamily: 'Montserrat'),
            ),
          ),
          const Spacer2(),
          //------------------------------------------------------------
        ],
      ),
    );
  }

//-------------------------------------------------------------------------------

  Widget _MyAccountDrawerItem() {
    return ListTile(
      title: Row(
        children: const <Widget>[
          Icon(CupertinoIcons.square_favorites_alt),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('My Account'),
          )
        ],
      ),
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginGateway()),
        );
      },
    );
  }
//-------------------------------------------------------------------------------

  Widget _AboutDrawerItem() {
    return ListTile(
      title: Row(
        children: const <Widget>[
          Icon(CupertinoIcons.person_2_alt),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('About'),
          )
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Aboutpage()),
        );
      },
    );
  }
//-------------------------------------------------------------------------------

  Widget _DashboardDrawerItem() {
    return ListTile(
      title: Row(
        children: const <Widget>[
          Icon(Icons.dashboard_rounded),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Dashboard'),
          )
        ],
      ),
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
      },
    );
  }
//-------------------------------------------------------------------------------

  Widget _HomeDrawerItem() {
    return ListTile(
      title: Row(
        children: const <Widget>[
          Icon(CupertinoIcons.home),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Home'),
          )
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CovamsHomePage()),
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
              // image: AssetImage('images/vaccine pic.png'))),
              image: AssetImage('images/covid_vaccine.jpeg'))),
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
