// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:covams_web/components/buttons.dart';
import 'package:covams_web/components/my_spacers.dart';

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: size.width / 14, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer2(),
              Text(
                "Sign In",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: size.height / 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height / 140,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: size.height / 20,
                  maxWidth: size.width,
                ),
                child: Text(
                  "Welcome Back! Enter your details to continue",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: size.height / 43,
                    color: Colors.black38,
                  ),
                ),
              ),
              //---------------------------------------------------------------------------------------------------------

              const Spacer3(),
              //---------------------------------------------------------------------------------------------------------

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                width: size.width,
                height: size.height / 18,
                child: TextField(
                  controller: usernameController,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "Enter username or  email",
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
              //---------------------------------------------------------------------------------------------------------

              const Spacer2(),

              //---------------------------------------------------------------------------------------------------------

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                width: size.width,
                height: size.height / 18,
                child: TextField(
                  obscureText: _isObscure,
                  controller: passwordController,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "Enter your password",
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            _isObscure = !_isObscure;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              //---------------------------------------------------------------------------------------------------------

              const Spacer4(),
              const SignInButton(),
              const Spacer1(),
              //---------------------------------------------------------------------------------------------------------
              // AlreadyHaveAnAccountCheck(press: goToSignUpPage),
            ],
          ),
        ),
      ),
    ));
  }
}
