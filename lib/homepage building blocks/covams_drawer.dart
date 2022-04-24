import 'package:covams_web/access%20pages/login%20pages/login_gateway.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:covams_web/main%20pages/covams_homepage.dart';
import 'package:flutter/material.dart';

import '../main pages/about_us.dart';
import '../main pages/dashboard.dart';

class ExploreDrawer extends StatefulWidget {
  const ExploreDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _ExploreDrawerState createState() => _ExploreDrawerState();
}

class _ExploreDrawerState extends State<ExploreDrawer> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'COVAMS',
                style: TextStyle(
                  fontSize: size.width / 15,
                  color: Colors.blue[200],
                ),
              ),
              const Spacer3(),
              //-----------------------------------------------------------

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
                child: Text(
                  ' > Home',
                  style: TextStyle(
                    color: _isHovering[0] ? Colors.blue[200] : Colors.white,
                  ),
                ),
              ),
              const Spacer2(),
              //-----------------------------------------------------------

              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[1] = true : _isHovering[1] = false;
                  });
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                },
                child: Text(
                  ' > Dashboard',
                  style: TextStyle(
                    color: _isHovering[1] ? Colors.blue[200] : Colors.white,
                  ),
                ),
              ),
              const Spacer2(),
              //------------------------------------------------------------

              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[2] = true : _isHovering[2] = false;
                  });
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Aboutpage()),
                  );
                },
                child: Text(
                  ' > About',
                  style: TextStyle(
                    color: _isHovering[2] ? Colors.blue[200] : Colors.white,
                  ),
                ),
              ),
              const Spacer2(),
              //------------------------------------------------------------

              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[3] = true : _isHovering[3] = false;
                  });
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginGateway()),
                  );
                },
                child: Text(
                  ' > My Account',
                  style: TextStyle(
                    color: _isHovering[3] ? Colors.blue[200] : Colors.white,
                  ),
                ),
              ),
              const Spacer2(),
              //------------------------------------------------------------

              Container(
                width: size.width - (size.width / 10),
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
        ),
      ),
    );
  }
}
