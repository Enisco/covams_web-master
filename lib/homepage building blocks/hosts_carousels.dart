import 'package:carousel_slider/carousel_slider.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:covams_web/utilities/responsive.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

class HostMinistriesCarousel extends StatefulWidget {
  const HostMinistriesCarousel({Key? key}) : super(key: key);

  @override
  _HostMinistriesCarouselState createState() => _HostMinistriesCarouselState();
}

class _HostMinistriesCarouselState extends State<HostMinistriesCarousel> {
  final String imagePath = 'images/';

  final CarouselController _controller = CarouselController();

  final List _isHovering = [false, false, false, false, false,];
  final List _isSelected = [true, false, false, false, false,];

  int _current = 0;

  final List<String> images = [
    'images/ncdc-logo.jpg',
    'images/Ministry of health.png',
    'images/naca.png',
    'images/ncaa.png',
    'images/nhis.png',
  ];

  final List<String> hosts = [
    'NCDC',
    'FMH',
    'NACA',
    'NCAA',
    'NHIS',
  ];

  final List<String> hostsFullNames = [
    'Nigerian Center for Disease Control',
    'Federal Ministry of Health',
    'National Agency for the Control of AIDS',
    'Nigerian Civil Aviation Authority',
    'National Health Insurance Scheme',
  ];

  static const List<String> pageURL = <String>[
    'https://ncdc.gov.ng',
    'https://www.health.gov.ng/',
    'https://naca.gov.ng/',
    'https://ncaa.gov.ng/',
    'https://www.nhis.gov.ng/',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => Container(
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(size);

    return Column(
      children: [
        TextButton(
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                scrollPhysics: ResponsiveWidget.isSmallScreen(context)
                    ? const PageScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                enlargeCenterPage: true,
                aspectRatio: 50 / 10,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                    for (int i = 0; i < imageSliders.length; i++) {
                      if (i == index) {
                        _isSelected[i] = true;
                      } else {
                        _isSelected[i] = false;
                      }
                    }
                  });
                }),
            carouselController: _controller,
          ),
          onPressed: () {
            js.context.callMethod('open', [pageURL[_current]]);
          },
        ),
        const Spacer0(),
        Center(
          child: Text(
            hostsFullNames[_current],
            style: TextStyle(
              letterSpacing: 2,
              fontSize: size.width / 40,
            ),
          ),
        ),
        const Spacer0(),
        Center(
          heightFactor: 1,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: size.width / 8,
                right: size.width / 8,
              ),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context)
                        ? 5
                        : size.height / 70,
                    bottom: ResponsiveWidget.isSmallScreen(context)
                        ? 5
                        : size.height / 70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < hosts.length; i++)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[i] = true
                                      : _isHovering[i] = false;
                                });
                              },
                              onTap: () {
                                _controller.animateToPage(i);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: ResponsiveWidget.isSmallScreen(context)
                                        ? 3
                                        : size.height / 80,
                                    bottom:
                                        ResponsiveWidget.isSmallScreen(context)
                                            ? 3
                                            : size.height / 90),
                                child: Text(
                                  hosts[i],
                                  style: TextStyle(
                                    color: _isHovering[i]
                                        ? Theme.of(context)
                                            .primaryTextTheme
                                            .button!
                                            .decorationColor
                                        : Theme.of(context)
                                            .primaryTextTheme
                                            .button!
                                            .color,
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              visible: _isSelected[i],
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 400),
                                opacity: _isSelected[i] ? 1 : 0,
                                child: Container(
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  width: size.width / 10,
                                ),
                              ),
                            )
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
