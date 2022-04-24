import 'package:flutter/material.dart';
import '../utilities/responsive.dart';
import 'dart:js' as js;

class FeaturedTiles extends StatelessWidget {
  FeaturedTiles({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  final List<String> assetsImages = [
    'images/ncdc director.jpg',
    'images/vaccines.png',
    'images/COVID19 Vaccine.jpg',
    'images/vaccine1.png',
    'images/Vaccines faqs.png',
  ];

  final List<String> title = [
    'Office of the Director General',
    'Vaccines',
    'Myths and Conspiracies',
    'Why Get Vaccinated',
    'FAQs',
  ];

  static const List<String> pageURL = <String>[
    'https://ncdc.gov.ng/dg',
    'https://covid19.trackvaccines.org/vaccines/approved/',
    'https://www.hopkinsmedicine.org/health/conditions-and-diseases/coronavirus/covid-19-vaccines-myth-versus-fact',
    'https://www.nfid.org/immunization/10-reasons-to-get-vaccinated/',
    'https://www.cdc.gov/coronavirus/2019-ncov/vaccines/faq.html',
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(top: screenSize.height / 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: screenSize.width / 15),
                  ...Iterable<int>.generate(assetsImages.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                js.context
                                    .callMethod('open', [pageURL[pageIndex]]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.03),
                                    border: Border.all(
                                      color: Colors.grey,
                                    )),
                                height: screenSize.width / 2.5,
                                width: screenSize.width / 1.5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.asset(
                                    assetsImages[pageIndex],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: Text(
                                title[pageIndex],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle1!
                                      .color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: screenSize.width / 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.06,
              left: screenSize.width / 15,
              right: screenSize.width / 15,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...Iterable<int>.generate(assetsImages.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                js.context
                                    .callMethod('open', [pageURL[pageIndex]]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.03),
                                    border: Border.all(
                                      color: Colors.grey,
                                    )),
                                height: screenSize.width / 6,
                                width: screenSize.width / 3.8,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.asset(
                                    assetsImages[pageIndex],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: Text(
                                title[pageIndex],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle1!
                                      .color,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
