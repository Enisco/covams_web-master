import 'package:covams_web/components/my_spacers.dart';
import 'package:covams_web/utilities/responsive.dart';
import 'package:flutter/material.dart';

class FloatingTitleBar extends StatefulWidget {
  const FloatingTitleBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _FloatingTitleBarState createState() => _FloatingTitleBarState();
}

class _FloatingTitleBarState extends State<FloatingTitleBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.40,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height / 50, horizontal: size.height / 50),
                  child: Column(
                    children: const [
                      Text(
                        "COVID-19 VACCINATION MANAGEMENT SYSTEM",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SpacerSmall(),
                      Text(
                        "Confirm, track, monitor, and update COVID-19 Vaccination Status",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height / 50,
                    horizontal: size.height / 50,
                  ),
                  child: Column(
                    children: const [
                      Text(
                        "COVID-19 VACCINATION MANAGEMENT SYSTEM",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SpacerSmall(),
                      Text(
                        "Confirm, track, monitor, and update COVID-19 Vaccination Status",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
