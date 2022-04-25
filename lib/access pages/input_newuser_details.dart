// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:covams_web/components/buttons.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController fullameController = TextEditingController();
TextEditingController surnameController = TextEditingController();
TextEditingController firstnameController = TextEditingController();
TextEditingController midnameController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController vaccHospNameController = TextEditingController();
TextEditingController mIdController = TextEditingController();
TextEditingController genderController = TextEditingController();
TextEditingController emailAddressController = TextEditingController();
TextEditingController passwordGivenController = TextEditingController();
TextEditingController vaccIdController = TextEditingController();

var userPhoneNumber;

DateTime firstSelectedDate = DateTime.now();
DateTime secondSelectedDate = DateTime.now();
DateTime boosterSelectedDate = DateTime.now();
var firstJabDate;
var secondJabDate;
var boosterJabDate;

class RegisterUserDetails extends StatefulWidget {
  const RegisterUserDetails({Key? key}) : super(key: key);

  @override
  State<RegisterUserDetails> createState() => _RegisterUserDetailsState();
}

class _RegisterUserDetailsState extends State<RegisterUserDetails> {
  void uploadData() {
    FirebaseFirestore.instance //add new doc to the data store
        .collection("covamsdata")
        .doc(vaccIdController.text)
        .set({
      "Surname": surnameController.text,
      "First Name": firstnameController.text,
      "Middle Name": midnameController.text,
      "Age": ageController.text,
      "Gender": genderController.text,
      "Email Address": emailAddressController.text,
      "Residential Address": addressController.text,
      "Phone Number": userPhoneNumber,
      "Means of Identification": mIdController.text,
      "Vaccination Centre Name": vaccHospNameController.text,
      "First Jab Date": firstJabDate,
      "Second Jab Date": secondJabDate,
      "Booster Jab Date": boosterJabDate,
      "Password": passwordGivenController.text,
    }).then((value) {
      print("success!");
    });
  }

  void goToSignUpSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddDetailsSuccess(),
      ),
    );
  }

  void resetTextControllers() {
    fullameController.text = '';
    firstnameController.text = '';
    midnameController.text = '';
    ageController.text = '';
    addressController.text = '';
    vaccHospNameController.text = '';
    mIdController.text = '';
    genderController.text = '';
    emailAddressController.text = '';
    passwordGivenController.text = '';
    vaccIdController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 1.8,
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: size.width / 8, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------------------------------------------------------------------------------------

            const Spacer1(),
            // const TopProgressLineMiddle(),
            const Spacer1(),
            //---------------------------------------------------------------------------------------------------------

            Text(
              "Add new user data",
              style: TextStyle(
                fontFamily: 'Poppins',
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
                "Full details is required to create user's account",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: size.height / 43,
                ),
              ),
            ),
            //---------------------------------------------------------------------------------------------------------

            const Spacer3(),
            //---------------------------------------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 18,
              child: TextField(
                controller: surnameController,
                cursorColor: Colors.blueGrey,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Surname',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Enter user's surname",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            //---------------------------------------------------------------------------------------------------------

            const Spacer2(),
            //---------------------------------------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 18,
              child: TextField(
                controller: firstnameController,
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    // color: Colors.black,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'First name',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  fillColor: Colors.white,
                  hintText: "Enter user's first name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            //---------------------------------------------------------------------------------------------------------

            const Spacer2(),
            //---------------------------------------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 18,
              child: TextField(
                controller: midnameController,
                cursorColor: Colors.blueGrey,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Middle name',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Enter user's middle name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            //---------------------------------------------------------------------------------------------------------

            const Spacer2(),
            //---------------------------------------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 18,
              child: TextField(
                controller: ageController,
                cursorColor: Colors.blueGrey,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Age',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "How old is the user?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),

            //---------------------------------------------------------------------------------------------------------

            const Spacer2(),
            //---------------------------------------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 18,
              child: TextField(
                controller: genderController,
                cursorColor: Colors.blueGrey,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Gender',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Male/Female",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            //---------------------------------------------------------------------------------------------------------

            const Spacer2(),
            //---------------------------------------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 18,
              child: TextField(
                controller: emailAddressController,
                cursorColor: Colors.blueGrey,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Enter user's email address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            //---------------------------------------------------------------------------------------------------------

            const Spacer2(),
            //---------------------------------------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 18,
              child: TextField(
                controller: addressController,
                cursorColor: Colors.blueGrey,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Residential Address',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Enter user's address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            //---------------------------------------------------------------------------------------------------------

            const Spacer2(),
            //---------------------------------------------------------------------------------------------------------

            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              width: size.width,
              height: size.height / 18,
              child: IntlPhoneField(
                initialCountryCode: 'NG',
                flagsButtonMargin: const EdgeInsets.fromLTRB(
                  10.0,
                  5.0,
                  5.0,
                  5.0,
                ),
                dropdownIcon: const Icon(
                  Icons.arrow_drop_down,
                ),
                dropdownIconPosition: IconPosition.trailing,
                disableLengthCheck: true,
                textAlignVertical: const TextAlignVertical(y: 0.0),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    // borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  labelText: '903 224 2379',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Your Phone Number",
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                onChanged: (phone) {
                  print(phone.completeNumber);
                  userPhoneNumber = phone.completeNumber;
                },
                onCountryChanged: (country) {
                  print('Country changed to: ' + country.name);
                },
              ),
            ),
            //---------------------------------------------------------------------------------------------------------

            const Spacer2(),
            //---------------------------------------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 18,
              child: TextField(
                controller: mIdController,
                cursorColor: Colors.blueGrey,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Means of Identification',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "NIN/Voter's card/Driver's License/International",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            //---------------------------------------------------------------------------------------------------------

            const Spacer2(),
            //---------------------------------------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 18,
              child: TextField(
                controller: vaccHospNameController,
                cursorColor: Colors.blueGrey,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Vaccination centre name',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Enter Vaccination centre name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            //---------------------------------------------------------------------------------------------------------

            const Spacer2(),
            //---------------------------------------------------------------------------------------------------------

            Text(
              "Dates of Jabs",
              style: TextStyle(
                color: Colors.grey[600],
                fontFamily: 'Poppins',
                fontSize: size.height / 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer0(),
            //---------------------------------------------------------------------------------------------------------

            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 3, horizontal: size.width / 100),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade600,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              width: size.width,
              height: size.height / 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "First Jab     ",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.height / 65,
                        fontWeight: FontWeight.w300),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.amber[900],
                    ),
                    iconSize: size.height / 35,
                    onPressed: () {
                      _firstDate(context);
                    },
                  ),
                  Text(
                    // "${firstSelectedDate.day}/${firstSelectedDate.month}/${firstSelectedDate.year}",
                    firstJabDate.toString(),
                  ),
                ],
              ),
            ),
            const Spacer0(),
            //---------------------------------------------------------------------------------------------------------

            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 3, horizontal: size.width / 100),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade600,
                ),
                // color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              width: size.width,
              height: size.height / 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Second Jab",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.height / 65,
                        fontWeight: FontWeight.w300),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.amber[900],
                    ),
                    iconSize: size.height / 35,
                    onPressed: () {
                      _secondDate(context);
                    },
                  ),
                  Text(
                    // "${secondSelectedDate.day}/${secondSelectedDate.month}/${secondSelectedDate.year}",
                    secondJabDate.toString(),
                  ),
                ],
              ),
            ),
            const Spacer0(),
            //---------------------------------------------------------------------------------------------------------

            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 3, horizontal: size.width / 100),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade600,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              width: size.width,
              height: size.height / 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Booster Jab",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.height / 65,
                        fontWeight: FontWeight.w300),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.amber[900],
                    ),
                    iconSize: size.height / 35,
                    onPressed: () {
                      _boosterDate(context);
                    },
                  ),
                  Text(
                    // "${boosterSelectedDate.day}/${boosterSelectedDate.month}/${boosterSelectedDate.year}",
                    boosterJabDate.toString(),
                  ),
                ],
              ),
            ),
            //---------------------------------------------------------------------------------------------------------

            const Spacer2(),
            //---------------------------------------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 18,
              child: TextField(
                controller: vaccIdController,
                cursorColor: Colors.blueGrey,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Vaccination ID',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Give user a uniqe Vaccination ID",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            //---------------------------------------------------------------------------------------------------------

            const Spacer2(),
            //---------------------------------------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 18,
              child: TextField(
                controller: passwordGivenController,
                cursorColor: Colors.blueGrey,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Give user his password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            //---------------------------------------------------------------------------------------------------------

            const Spacer4(),
            Text(
              "ATTENTION: Confirm all information before pressing the submit button",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: size.height / 43,
                color: Colors.black38,
              ),
            ),

            const Spacer2(),
            BlackNextButton(pressed: uploadData),
            const Spacer1(),
            //---------------------------------------------------------------------------------------------------------
          ],
        ),
      ),
    );
  }
  //---------------------------****************************--------------------------

  _firstDate(BuildContext context) async {
    final DateTime? firstSelected = await showDatePicker(
      context: context,
      initialDate: firstSelectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );
    if (firstSelected != null && firstSelected != firstSelectedDate) {
      setState(() {
        firstSelectedDate = firstSelected;
        firstJabDate =
            "${firstSelectedDate.day}/${firstSelectedDate.month}/${firstSelectedDate.year}";
        print(firstJabDate);
      });
    }
  }

  _secondDate(BuildContext context) async {
    final DateTime? secondSelected = await showDatePicker(
      context: context,
      initialDate: secondSelectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );
    if (secondSelected != null && secondSelected != secondSelectedDate) {
      setState(() {
        secondSelectedDate = secondSelected;
        secondJabDate =
            "${secondSelectedDate.day}/${secondSelectedDate.month}/${secondSelectedDate.year}";
        print(secondJabDate);
      });
    }
  }

  _boosterDate(BuildContext context) async {
    final DateTime? boosterSelected = await showDatePicker(
      context: context,
      initialDate: boosterSelectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );
    if (boosterSelected != null && boosterSelected != boosterSelectedDate) {
      setState(() {
        boosterSelectedDate = boosterSelected;
        boosterJabDate =
            "${boosterSelectedDate.day}/${boosterSelectedDate.month}/${boosterSelectedDate.year}";
        print(boosterJabDate);
      });
    }
  }
}

class AddDetailsSuccess extends StatelessWidget {
  const AddDetailsSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
