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
        ? (size.width / 50)
        : (size.width / 65);

    var text1Fontsize = ResponsiveWidget.isSmallScreen(context)
        ? (size.width / 70)
        : (size.width / 80);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Column(
              children: [
                Text(
                  "Dashboard",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveWidget.isSmallScreen(context)
                        ? size.width / 15
                        : size.width / 40,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer3(),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: size.width / 30,
          runSpacing: size.width / 30,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            _dashboardContainer(
                assetImage: const AssetImage('images/nigeria_whiteRed.jpg'), //
                headingText: 'Cummulative Cases',
                Text1: '255,685',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            _dashboardContainer(
                assetImage: const AssetImage('images/Nigeria small red.png'), //
                headingText: 'Total Deaths',
                Text1: '3,143',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            _dashboardContainer(
                assetImage:
                    const AssetImage('images/Nigeria_location_map.png'), //
                headingText: 'New cases in Last 24 hours',
                Text1: '0',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            //--------------------------------------------------------------------

            _dashboardContainer(
                assetImage:
                    const AssetImage('images/nigeria-map africa-map.png'), //
                headingText: 'Approved vaccines in Nigeria',
                Text1: '07',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            _dashboardContainer(
                assetImage: const AssetImage('images/Nigeria_in_au.png'), //
                headingText: 'Total administered vaccine doses',
                Text1: '33,932,163',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 2.6),
            _dashboardContainer(
                assetImage: const AssetImage('images/map nigeria.jpg'), //
                headingText: 'Average daily dose administration',
                Text1: '228,908',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            //--------------------------------------------------------------------

            _dashboardContainer(
                assetImage: const AssetImage('images/people nigeria.jpg'), //
                headingText: 'Persons vaccinated with at least one dose',
                Text1: '22,575,395',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 2.7),
            _dashboardContainer(
                assetImage:
                    const AssetImage('images/africa white green.jpg'), //
                headingText: 'Percentage of vaccinated population',
                Text1: '16.46%',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            _dashboardContainer(
                assetImage:
                    const AssetImage('images/map-nigeria-in-africa..jpg'), //
                headingText: 'Fully Vaccinated Individuals',
                Text1: '13,313,220',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 3),
            //--------------------------------------------------------------------

            _dashboardContainer(
                assetImage: const AssetImage(
                    'images/nigeria-highlighted-on-africa-map.jpg'), //
                headingText:
                    'Persons vaccinated with booster or additional dose',
                Text1: '829,646',
                containersize: containerWidth,
                fontsizeHeader: headerFontsize,
                fontsiseText1: text1Fontsize * 2.7),
            _dashboardContainer(
                assetImage: const AssetImage('images/nigeria-location.jpg'), //
                headingText: 'Percentage of boosted population',
                Text1: '0.4%',
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

  Widget _dashboardContainer({
    required AssetImage assetImage,
    required String headingText,
    required String Text1,
    var containersize,
    var fontsizeHeader,
    var fontsiseText1,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 0, 20),
      width: containersize,
      height: containersize,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.black38),
          image: DecorationImage(fit: BoxFit.fill, image: assetImage)),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            width: containersize * 0.9,
            height: containersize * 0.33,
            decoration: BoxDecoration(
              color: Colors.grey.shade300.withOpacity(0.5),
              border: Border.all(color: Colors.black38),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  headingText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: fontsizeHeader,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 1,
                  height: containersize * 0.015,
                ),
                Text(
                  Text1,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: fontsiseText1,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
