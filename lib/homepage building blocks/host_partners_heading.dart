import 'package:covams_web/utilities/responsive.dart';
import 'package:flutter/material.dart';

class HostMinistriesHeading extends StatelessWidget {
  const HostMinistriesHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: Row(
        children: [
          Text(
            'Host Ministries and Parastatals',
            style: TextStyle(
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 18 : 35,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
//---------------------------**************************-------------------------------

class PartnersHeading extends StatelessWidget {
  const PartnersHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        // top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: Row(
        children: [
          Text(
            'Partner Organizations',
            style: TextStyle(
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 18 : 35,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
//---------------------------**************************-------------------------------

