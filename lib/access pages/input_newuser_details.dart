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

class AddDetails extends StatefulWidget {
  const AddDetails({Key? key}) : super(key: key);

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
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
    // Navigator.push(
    //   context,
    //   PageTransition(
    //       type: PageTransitionType.bottomToTop,
    //       curve: Curves.easeInOutCirc,
    //       duration: const Duration(milliseconds: 1000),
    //       reverseDuration: const Duration(milliseconds: 1000),
    //       child: const SIgnUpSuccess(),
    //       inheritTheme: true,
    //       ctx: context),
    // );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Container(
        height: double.infinity,
        width: double.infinity,
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
                  color: Colors.black,
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
                  controller: surnameController,
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
                    labelText: 'Surname',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "Enter user's surname",
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
                  controller: firstnameController,
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
                    labelText: 'First name',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "Enter user's first name",
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
                  controller: midnameController,
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
                    labelText: 'Middle name',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "Enter user's middle name",
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
                  controller: ageController,
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
                    labelText: 'Age',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "How old is the user?",
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
                  controller: genderController,
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
                    labelText: 'Gender',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "Male/Female",
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
                  controller: emailAddressController,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    labelText: 'Email Address',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "Enter user's email address",
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
                  controller: addressController,
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
                    labelText: 'Residential Address',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "Enter user's address",
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
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    labelText: '903 224 2379',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "Your Phone Number",
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
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

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                width: size.width,
                height: size.height / 18,
                child: TextField(
                  controller: mIdController,
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
                    labelText: 'Means of Identification',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "NIN/Voter's card/Driver's License/International",
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
                  controller: vaccHospNameController,
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
                    labelText: 'Vaccination centre name',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "Enter Vaccination centre name",
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
                    vertical: 3, horizontal: size.width / 80),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                width: size.width,
                height: size.height / 18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "First Jab     ",
                      style: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'Poppins',
                        fontSize: size.height / 47,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.amber[900],
                      ),
                      iconSize: size.height / 30,
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
                    vertical: 3, horizontal: size.width / 80),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                width: size.width,
                height: size.height / 18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Second Jab",
                      style: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'Poppins',
                        fontSize: size.height / 47,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.amber[900],
                      ),
                      iconSize: size.height / 30,
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
                    vertical: 3, horizontal: size.width / 80),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                width: size.width,
                height: size.height / 18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Booster Jab",
                      style: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'Poppins',
                        fontSize: size.height / 47,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.amber[900],
                      ),
                      iconSize: size.height / 30,
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

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                width: size.width,
                height: size.height / 18,
                child: TextField(
                  controller: vaccIdController,
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
                    labelText: 'Vaccination ID',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "Give user a uniqe Vaccination ID",
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
                  controller: passwordGivenController,
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
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
                    ),
                    hintText: "Give user his password",
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black38,
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
      ),
    ));
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
