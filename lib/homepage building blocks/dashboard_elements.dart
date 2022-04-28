import 'package:covams_web/components/my_spacers.dart';
import 'package:covams_web/utilities/responsive.dart';
import 'package:flutter/material.dart';

// BuildContext context = context;

// Size size = MediaQuery.of(context).size;
// var containerWidth = ResponsiveWidget.isSmallScreen(context)
//     ? (size.width * 0.7)
//     : (size.width / 3.5);

class DashboardElements extends StatelessWidget {
  const DashboardElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var containerWidth = ResponsiveWidget.isSmallScreen(context)
        ? (size.width * 0.35)
        : (size.width / 3.5);

    var headerFontsize = ResponsiveWidget.isSmallScreen(context)
        ? (size.width / 30)
        : (size.width / 50);

    var text1Fontsize = ResponsiveWidget.isSmallScreen(context)
        ? (size.width / 50)
        : (size.width / 70);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Row(
        //   children: [
        //     Column(
        //       children: [
        //         Text(
        //           "Dashboard",
        //           style: TextStyle(
        //             fontFamily: 'Poppins',
        //             // color: Colors.black,
        //             fontSize: ResponsiveWidget.isSmallScreen(context)
        //                 ? size.width / 15
        //                 : size.width / 40,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        const Spacer3(),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: size.width / 30,
          runSpacing: size.width / 30,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            _dashboardContainer(
                assetImage: const AssetImage('images/COVID19 Vaccine.jpg'),
                headingText: 'Cummulative Cases',
                Text1: '255,685',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            _dashboardContainer(
                assetImage: const AssetImage('images/vaccine1.png'),
                headingText: 'Total Deaths',
                Text1: '3,143',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            _dashboardContainer(
                assetImage: const AssetImage('images/vaccine pic.jpg'),
                headingText: 'New cases in Last 24 hours',
                Text1: '0',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            //--------------------------------------------------------------------

            _dashboardContainer(
                assetImage: const AssetImage('images/COVID19 Vaccine.jpg'),
                headingText: 'Approved vaccines in Nigeria',
                Text1: '7',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            _dashboardContainer(
                assetImage: const AssetImage('images/vaccine1.png'),
                headingText: 'Total administered vaccine doses',
                Text1: '33,932,163',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 2.6),
            _dashboardContainer(
                assetImage: const AssetImage('images/vaccine pic.jpg'),
                headingText: 'Average daily dose administration',
                Text1: '228,908',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            //--------------------------------------------------------------------

            _dashboardContainer(
                assetImage: const AssetImage('images/vaccine1.png'),
                headingText: 'Persons vaccinated with at least one dose',
                Text1: '22,575,395',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            _dashboardContainer(
                assetImage: const AssetImage('images/vaccine pic.jpg'),
                headingText: 'Percentage of vaccinated population',
                Text1: '16.46%',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            _dashboardContainer(
                assetImage: const AssetImage('images/vaccine pic.jpg'),
                headingText: 'Fully Vaccinated Individuals',
                Text1: '13,313,220',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            //--------------------------------------------------------------------

            _dashboardContainer(
                assetImage: const AssetImage('images/vaccine pic.jpg'),
                headingText:
                    'Persons vaccinated with booster or additional dose',
                Text1: '829,646',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            _dashboardContainer(
                assetImage: const AssetImage('images/vaccine pic.jpg'),
                headingText: 'Percentage of boosted population',
                Text1: '829,646',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            //--------------------------------------------------------------------
          ],
        ),
        const Spacer4()
      ],
    );
  }

  Widget _dashboardContainer(
      {required AssetImage assetImage,
      required String headingText,
      required String Text1,
      var containersize,
      var fontsizeHeader,
      var fontsiseText1}) {
    return Container(
      padding: const EdgeInsets.all(6),
      width: containersize,
      height: containersize,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(fit: BoxFit.fill, image: assetImage)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            headingText,
            textAlign: TextAlign.end,
            style: TextStyle(
                // color: Colors.white,
                fontSize: fontsizeHeader,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 1,
            height: containersize / 10,
          ),
          Text(
            Text1,
            style: TextStyle(
                // color: Colors.white,
                fontSize: fontsiseText1,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
