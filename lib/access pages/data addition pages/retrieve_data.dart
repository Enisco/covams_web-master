// ignore_for_file: must_be_immutable, avoid_print

// import 'package:firebase_flutter_demo/my_spacers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covams_web/components/my_spacers.dart';
import 'package:flutter/material.dart';

String fullName = '',
    age = '',
    gender = '',
    mId = '',
    address = '',
    phoneNumber = '',
    emailAddress = '',
    jab1Date = '',
    jab2Date = '',
    boosterJabDate = '',
    hospVaccCentre = '',
    vaccineType = '',
    errorMessage = '';
int dataExists = 0;

class RetrieveDataFromStore extends StatefulWidget {
  RetrieveDataFromStore({
    Key? key,
    required this.userUniqueID,
    required this.errMessage,
  }) : super(key: key);

  String userUniqueID;
  String errMessage;

  @override
  State<RetrieveDataFromStore> createState() => _RetrieveDataFromStoreState();
}

class _RetrieveDataFromStoreState extends State<RetrieveDataFromStore> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var fontsize = size.height / 45;
    retrieveData(widget.userUniqueID);

    return Container(
      child: dataExists == 0
          ? SizedBox(
              height: size.height / 20,
              child: Text(
                errorMessage,
                style: TextStyle(fontSize: size.width / 40, color: Colors.red),
              ),
            )
          : Center(
              child: SizedBox(
                height: size.height * 0.9,
                child: Center(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer3(),
                      Center(
                        child: Text(
                          'Details of user with ID: ' + widget.userUniqueID,
                          style: TextStyle(
                              fontSize: size.height / 35,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer3(),
                          //----------------------------------------------------------------------------------

                          RichText(
                            text: TextSpan(
                              text: 'Full name: ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: fontsize,
                                fontWeight: FontWeight.w300,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: fullName,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SpacerSmall(),
                          const SeperationLine(),
                          const Spacer1(),
                          //----------------------------------------------------------------------------------

                          RichText(
                            text: TextSpan(
                              text: 'Age: ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: fontsize,
                                fontWeight: FontWeight.w300,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: age,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SpacerSmall(),
                          const SeperationLine(),
                          const Spacer1(),
                          //----------------------------------------------------------------------------------

                          RichText(
                            text: TextSpan(
                              text: 'Gender: ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: fontsize,
                                fontWeight: FontWeight.w300,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: gender,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SpacerSmall(),
                          const SeperationLine(),
                          const Spacer1(),
                          //----------------------------------------------------------------------------------

                          RichText(
                            text: TextSpan(
                              text: 'Residential Address: ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: fontsize,
                                fontWeight: FontWeight.w300,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: address,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SpacerSmall(),
                          const SeperationLine(),
                          const Spacer1(),
                          //----------------------------------------------------------------------------------

                          RichText(
                            text: TextSpan(
                              text: 'Phone Number: ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: fontsize,
                                fontWeight: FontWeight.w300,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: phoneNumber,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SpacerSmall(),
                          const SeperationLine(),
                          const Spacer1(),
                          //----------------------------------------------------------------------------------

                          RichText(
                            text: TextSpan(
                              text: 'Email Address: ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: fontsize,
                                fontWeight: FontWeight.w300,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: emailAddress,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SpacerSmall(),
                          const SeperationLine(),
                          const Spacer1(),
                          //----------------------------------------------------------------------------------

                          RichText(
                            text: TextSpan(
                              text: 'Means of Identification: ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: fontsize,
                                fontWeight: FontWeight.w300,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: mId,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SpacerSmall(),
                          const SeperationLine(),
                          const Spacer1(),
                          //----------------------------------------------------------------------------------

                          RichText(
                            text: TextSpan(
                              text: 'First Jab Date: ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: fontsize,
                                fontWeight: FontWeight.w300,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: jab1Date,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SpacerSmall(),
                          const SeperationLine(),
                          const Spacer1(),
                          //----------------------------------------------------------------------------------

                          RichText(
                            text: TextSpan(
                              text: 'Second Jab Date: ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: fontsize,
                                fontWeight: FontWeight.w300,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: jab2Date,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SpacerSmall(),
                          const SeperationLine(),
                          const Spacer1(),
                          //----------------------------------------------------------------------------------

                          RichText(
                            text: TextSpan(
                              text: 'Booster Jab Date: ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: fontsize,
                                fontWeight: FontWeight.w300,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: boosterJabDate,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SpacerSmall(),
                          const SeperationLine(),
                          const Spacer1(),
                          //----------------------------------------------------------------------------------

                          RichText(
                            text: TextSpan(
                              text: 'Vaccination Centre Name: ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: fontsize,
                                fontWeight: FontWeight.w300,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: hospVaccCentre,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SpacerSmall(),
                          const SeperationLine(),
                          const Spacer1(),
                          //----------------------------------------------------------------------------------

                          RichText(
                            text: TextSpan(
                              text: 'Received Vaccine Type: ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: fontsize,
                                fontWeight: FontWeight.w300,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: vaccineType,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SpacerSmall(),
                          const SeperationLine(),
                          const Spacer1(),
                          //----------------------------------------------------------------------------------
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void retrieveData(String suppliedID) async {
    final docSnapShot = await FirebaseFirestore.instance
        .collection("covamsdata")
        .doc(suppliedID)
        .get();
    if (docSnapShot.exists) {
      if (mounted) {
        setState(() {
          dataExists = 1;
        });
      }
      String surname = docSnapShot.data()!["Surname"].toString();
      String firstname = docSnapShot.data()!["First Name"].toString();
      String midname = docSnapShot.data()!["Middle Name"].toString();
      fullName = '$surname $firstname $midname';
      age = docSnapShot.data()!["Age"].toString();
      gender = docSnapShot.data()!["Gender"].toString();
      address = docSnapShot.data()!["Residential Address"].toString();
      phoneNumber = docSnapShot.data()!["Phone Number"].toString();
      emailAddress = docSnapShot.data()!["Email Address"].toString();
      mId = docSnapShot.data()!["Means of Identification"].toString();
      jab1Date = docSnapShot.data()!["First Jab Date"].toString();
      jab2Date = docSnapShot.data()!["Second Jab Date"].toString();
      boosterJabDate = docSnapShot.data()!["Booster Jab Date"].toString();
      hospVaccCentre =
          docSnapShot.data()!["Vaccination Centre Name"].toString();
      vaccineType = docSnapShot.data()!["Vaccine Type"].toString();

      print('$fullName\n$address\n$boosterJabDate');
    } else {
      print('User not found');
      if (mounted) {
        setState(() {
          errorMessage = 'User not found';
        });
      }
    }
  }
}

class SeperationLine extends StatelessWidget {
  const SeperationLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width - (size.width / 12),
      height: 1,
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
