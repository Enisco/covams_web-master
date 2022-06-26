import 'package:covams_web/utilities/responsive.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../components/my_spacers.dart';

// String ourWhatsappUrl = 'https://wa.link/o20n95';
const String ourWhatsappUrl =
    "https://api.whatsapp.com/send/?phone=2349032242379";
//     "https://api.whatsapp.com/send/?phone=2348101564160";

//--------------------------------------------------------------------------------------

void goToOurWhatsapp(String ourWhatsappUrl) {
  try {
    launchUrlString(
      ourWhatsappUrl,
      // mode: LaunchMode.externalNonBrowserApplication,
      webViewConfiguration: const WebViewConfiguration(
        enableJavaScript: false,
      ),
    );
  } catch (e) {
    throw 'Could not launch $ourWhatsappUrl';
  }
}
//--------------------------------------------------------------------------------------

class BottomSection extends StatefulWidget {
  const BottomSection({Key? key}) : super(key: key);

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // color: Colors.black26,
      child: ResponsiveWidget.isSmallScreen(context)
          ? const BottomBarForSmallScreen()
          : const BottomBarForBigScreen(),
    );
  }
}
//------------------------------------****************------------------------------------

class BottomBarForSmallScreen extends StatelessWidget {
  const BottomBarForSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).bottomAppBarColor,
      child: Column(
        children: [
          const Spacer1(),
          SizedBox(
            width: size.width,
            height: size.height * 0.20,
            child: const LeftDown(),
          ),
          //------------------

          Container(
            width: size.width - (size.width / 10),
            height: 1,
            color: Colors.blueGrey,
          ),
          //------------------

          Center(
            child: SizedBox(
              width: size.width,
              height: size.height * 0.20,
              child: const RightDownSmallScreen(),
            ),
          ),
          Container(
            width: size.width - (size.width / 10),
            height: 1,
            color: Colors.blueGrey,
          ),
          const Spacer2(),
          //------------------
          const DownDown(),
          const Spacer2(),
          //------------------
        ],
      ),
    );
  }
}
//------------------------------------****************------------------------------------

class BottomBarForBigScreen extends StatelessWidget {
  const BottomBarForBigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Theme.of(context).bottomAppBarColor,
      child: Column(
        children: [
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.45,
                    height: size.height * 0.30,
                    child: const LeftDown(),
                  ),
                  //------------------

                  SizedBox(
                    width: size.width * 0.04,
                    height: size.height * 0.15,
                  ),

                  Container(
                    width: 1,
                    height: size.height * 0.15,
                    color: Colors.blueGrey,
                  ),
                  //------------------

                  SizedBox(
                    width: size.width * 0.45,
                    height: size.height * 0.30,
                    child: const RightDown(),
                  ),
                ],
              ),
            ],
          ),

          //------------------

          Container(
            width: size.width - (size.width / 18),
            height: 1,
            color: Colors.blueGrey,
          ),
          const Spacer2(),
          //------------------

          const DownDown(),
          const Spacer2(),
          //------------------
        ],
      ),
    );
  }
}
//------------------------------------****************------------------------------------

class LeftDown extends StatelessWidget {
  const LeftDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer2(),
        //--------------------------------------------------------------------------
        RichText(
          text: TextSpan(
            text: 'Call/Whatsapp: ',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white70,
              fontSize: ResponsiveWidget.isSmallScreen(context)
                  ? size.width / 25
                  : size.width / 75,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                text: " +2349032242379",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.blue.withOpacity(0.6),
                  fontSize: ResponsiveWidget.isSmallScreen(context)
                      ? size.width / 25
                      : size.width / 75,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    goToOurWhatsapp(ourWhatsappUrl);
                  },
              ),
            ],
          ),
        ),
        const SpacerSmall(),
        //--------------------------------------------------------------------------

        RichText(
          text: TextSpan(
            text: 'Email: ',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white70,
              fontSize: ResponsiveWidget.isSmallScreen(context)
                  ? size.width / 25
                  : size.width / 75,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                text: " vaccinations@covams.org",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.blue.withOpacity(0.6),
                  fontSize: ResponsiveWidget.isSmallScreen(context)
                      ? size.width / 25
                      : size.width / 75,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    goToOurWhatsapp(ourWhatsappUrl);
                  },
              ),
            ],
          ),
        ),
        const Spacer2(),
        //--------------------------------------------------------------------------
      ],
    );
  }
}
//------------------------------------****************------------------------------------

class RightDownSmallScreen extends StatelessWidget {
  const RightDownSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //--------------------------------------------------------------------------

        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                  size: ResponsiveWidget.isSmallScreen(context)
                      ? size.width / 25
                      : size.width / 75,
                ),
                onPressed: () {},
              ),
              Text(
                "Facebook",
                style: TextStyle(
                  fontSize: ResponsiveWidget.isSmallScreen(context)
                      ? size.width / 25
                      : size.width / 75,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
        //----------------------------------

        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.twitter,
                  color: Colors.blue,
                  size: ResponsiveWidget.isSmallScreen(context)
                      ? size.width / 25
                      : size.width / 75,
                ),
                onPressed: () {},
              ),
              Text(
                "Twitter",
                style: TextStyle(
                  fontSize: ResponsiveWidget.isSmallScreen(context)
                      ? size.width / 25
                      : size.width / 75,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
        //----------------------------------

        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.youtube,
                  color: Colors.red,
                  size: ResponsiveWidget.isSmallScreen(context)
                      ? size.width / 25
                      : size.width / 75,
                ),
                onPressed: () {},
              ),
              Text(
                "YouTube",
                style: TextStyle(
                  fontSize: ResponsiveWidget.isSmallScreen(context)
                      ? size.width / 25
                      : size.width / 75,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
//------------------------------------****************------------------------------------

class RightDown extends StatelessWidget {
  const RightDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //--------------------------------------------------------------------------

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: size.width / 60,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    "Facebook",
                    style: TextStyle(
                      fontSize: size.width / 80,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
            const SpacerSmall(),
            //----------------------------------

            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.blue,
                      size: size.width / 60,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    "Twitter",
                    style: TextStyle(
                      fontSize: size.width / 80,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
            const SpacerSmall(),
            //----------------------------------

            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.youtube,
                      color: Colors.red,
                      size: size.width / 60,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    "YouTube",
                    style: TextStyle(
                      fontSize: size.width / 80,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),

            //--------------------------------------------------------------------------
          ],
        )
      ],
    );
  }
}

//------------------------------------****************------------------------------------

class DownDown extends StatelessWidget {
  const DownDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Text(
      "© CopyRight | CoVaMS 2022",
      style: TextStyle(
          color: Colors.white54,
          fontSize: ResponsiveWidget.isSmallScreen(context)
              ? size.width / 30
              : size.width / 75,
          fontFamily: 'Montserrat'),
    );
  }
}
