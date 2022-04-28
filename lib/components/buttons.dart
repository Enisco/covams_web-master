// import 'package:bloom/pages/mainpages/bloom_homepage.dart';
import 'package:flutter/material.dart';

class BlackNextButton extends StatelessWidget {
  final Function pressed;

  const BlackNextButton({
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width / 1.5,
        height: size.height / 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
        ),
        child: InkWell(
          splashColor: Colors.white10,
          child: TextButton(
            child: Text(
              "Submit",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: size.height / 45,
              ),
            ),
            onPressed: () {
              // ignore: avoid_print
              print("Submitted");
              pressed();
            },
          ),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final Function pressed;

  const SignInButton({
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width / 1.5,
        height: size.height / 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
        ),
        child: InkWell(
          splashColor: Colors.white10,
          child: TextButton(
            child: Text(
              "Sign In",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: size.height / 45,
              ),
            ),
            onPressed: () {
              // print("Signed In");
              pressed();
            },
          ),
        ),
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  final Function pressed;

  const SearchButton({
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width / 8,
        height: size.height / 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
        ),
        child: InkWell(
          splashColor: Colors.white10,
          child: TextButton(
            child: Text(
              "Search",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: size.width / 45,
              ),
            ),
            onPressed: () {
              print("Signed In");
              pressed();
            },
          ),
        ),
      ),
    );
  }
}
