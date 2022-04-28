// ignore_for_file: non_constant_identifier_names

import 'package:covams_web/access%20pages/stakeholders%20pages/admin_page.dart';
import 'package:covams_web/access%20pages/stakeholders%20pages/hosp_vacc_page.dart';
import 'package:covams_web/access%20pages/stakeholders%20pages/user_page.dart';
import 'package:covams_web/access%20pages/stakeholders%20pages/verif_cent_page.dart';
import 'package:covams_web/blocs/login_string_bloc.dart';
import 'package:covams_web/main%20pages/covams_homepage.dart';
import 'package:flutter/cupertino.dart';

List<Widget> accesssPages = [
  const CovamsHomePage(),
  const AdminPage(),
  const HospVaccCentPage(),
  const VerifCentPage(),
  UserPage(
    userUniqueID: loginString,
  )
];
