// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:covams_web/access%20pages/data%20addition%20pages/reg_newuser_details.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:covams_web/components/buttons.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController verifCentrefullNameController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController emailAddressController = TextEditingController();
TextEditingController passwordGivenController = TextEditingController();
TextEditingController uniqueIdController = TextEditingController();

var vaccCentrePhoneNumber;

DateTime regSelectedDate = DateTime.now();
var registrationDate;

class RegisterVerifCentre extends StatefulWidget {
  const RegisterVerifCentre({Key? key}) : super(key: key);

  @override
  State<RegisterVerifCentre> createState() => _RegisterVerifCentreState();
}

class _RegisterVerifCentreState extends State<RegisterVerifCentre> {
  void uploadData() {
    FirebaseFirestore.instance //add new doc to the data store
        .collection("covamsdata")
        .doc(uniqueIdController.text)
        .set({
      "Account Type": "Verification Centre",
      "Verification Centre name": verifCentrefullNameController.text,
      "Address": addressController.text,
      "Email Address": emailAddressController.text,
      "Phone Number": vaccCentrePhoneNumber,
      "Date of Registration": registrationDate,
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
    verifCentrefullNameController.text = '';
    addressController.text = '';
    emailAddressController.text = '';
    passwordGivenController.text = '';
    uniqueIdController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: size.width / 8, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------------------------------------------------------------------------------------

            const Spacer1(),
            const Spacer1(),
            //---------------------------------------------------------------------------------------------------------

            Text(
              "Register new Verification Centre",
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
                "Full details is required to create Verification Centre's account",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: size.height / 43,
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
                controller: verifCentrefullNameController,
                cursorColor: Colors.blueGrey,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Verification Centre Name',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Enter the name of the Verification Centre",
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
                  hintText: "Enter Official/Organizational email address",
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
                  labelText: 'Address',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Enter address of Hospial Vaccination Centre",
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
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  labelText: '903 224 2379',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Your Official/Organizational Phone Number",
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                onChanged: (phone) {
                  print(phone.completeNumber);
                  vaccCentrePhoneNumber = phone.completeNumber;
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
              padding: EdgeInsets.symmetric(
                  vertical: 3, horizontal: size.width / 100),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black38,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              width: size.width,
              height: size.height / 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date of Registration",
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
                      _regDate(context);
                    },
                  ),
                  Text(
                    registrationDate.toString(),
                  ),
                ],
              ),
            ),
            const Spacer0(),
            //---------------------------------------------------------------------------------------------------------

            const Spacer2(),
            //---------------------------------------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 18,
              child: TextField(
                controller: uniqueIdController,
                cursorColor: Colors.blueGrey,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Uniqe ID',
                  labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  hintText: "Give Vaccination Center a uniqe ID",
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
                  hintText: "Give the Vaccination Center a password",
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

  _regDate(BuildContext context) async {
    final DateTime? firstSelected = await showDatePicker(
      context: context,
      initialDate: regSelectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );
    if (firstSelected != null && firstSelected != regSelectedDate) {
      setState(() {
        regSelectedDate = firstSelected;
        registrationDate =
            "${regSelectedDate.day}/${regSelectedDate.month}/${regSelectedDate.year}";
        print(registrationDate);
      });
    }
  }
}

// class RegisterVerifCentreSuccess extends StatelessWidget {
//   const RegisterHospVaccCentreSuccess({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
