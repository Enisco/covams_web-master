// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covams_web/access%20pages/data%20addition%20pages/retrieve_data.dart';
import 'package:covams_web/access%20pages/stakeholders%20pages/user_page.dart';
import 'package:covams_web/components/buttons.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

TextEditingController searchController = TextEditingController();
String searchedID = '';

class ConfirmUserDetails extends StatefulWidget {
  const ConfirmUserDetails({Key? key}) : super(key: key);

  @override
  State<ConfirmUserDetails> createState() => _ConfirmUserDetailsState();
}

class _ConfirmUserDetailsState extends State<ConfirmUserDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Spacer3(),
        Text(
          'Verify Vaccination Status',
          style: TextStyle(fontSize: size.width / 40),
        ),
        const Spacer1(),
        Text(
          'Confirm a user\'s vaccination status by searching with their unique ID',
          style: TextStyle(fontSize: size.width / 80),
        ),
        const Spacer2(),
        SizedBox(
          height: size.height / 15,
          width: size.width / 2.3,
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              labelStyle: TextStyle(color: Colors.blueGrey[600]),
              fillColor: Colors.white,
              hintText: 'Enter user ID to search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusColor: Colors.blueGrey,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
            ),
          ),
        ),
        //---------------------------------------------------------------------------------------------------------

        const Spacer2(),
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: size.height / 10, maxWidth: size.width / 2),
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.red, fontSize: size.height / 40),
            ),
          ),
        ),
        //---------------------------------------------------------------------------------------------------------

        const Spacer1(),
        SearchButton(
          pressed: () {
            if (searchController.text == '') {
              print('Enter text to search');
              if (mounted) {
                setState(() {
                  errorMessage = 'Enter text to search';
                });
              }
            } else {
              if (mounted) {
                setState(() {
                  searchedID = searchController.text;
                  userSearchAction(searchedUserID: searchedID);
                });
              }
            }
          },
        ),
      ],
    );
  }

  void userSearchAction({required String searchedUserID}) async {
    String accountType = "User";
    String readAccountType;

    final docSnapShot = await FirebaseFirestore.instance
        .collection("covamsdata")
        .doc(searchedUserID)
        .get();
    if (docSnapShot.exists) {
      readAccountType = docSnapShot.data()!["Account Type"].toString();
      if (readAccountType == accountType) {
        print('User is registered');
        if (mounted) {
          setState(
            () {
              errorMessage = '';
            },
          );
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserPage(
              userUniqueID: searchedUserID,
            ),
          ),
        );
      } else {
      _userNotFoundAlert(context);
        if (mounted) {
          setState(
            () {
              errorMessage = 'User not found';
            },
          );
        }
      }
      if (docSnapShot.data() == null) {
      _userNotFoundAlert(context);
        print('User not found');
        setState(() {
          errorMessage = 'User not found';
        });
      }
    } else {
      _userNotFoundAlert(context);
      print('User not found');
      setState(() {
        errorMessage = 'User not found';
      });
    }
  }

  _userNotFoundAlert(context) {
    Alert(
      context: context,
      title: "ERROR",
      desc: "User not found",
    ).show();
  }
}
  
  
//covams00004