import 'dart:ui';
import 'package:covams_web/blocs/appbar_string_bloc.dart';
import 'package:covams_web/blocs/login_state_bloc.dart';
import 'package:covams_web/blocs/login_string_bloc.dart';
import 'package:covams_web/blocs/logintype_index.dart';
import 'package:covams_web/main%20pages/covams_homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:covams_web/utilities/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginStateBloc>(
          create: (BuildContext context) => LoginStateBloc(),
        ),
        BlocProvider<LoginStringBloc>(
          create: (BuildContext context) => LoginStringBloc(),
        ),
        BlocProvider<LoginIntBloc>(
          create: (BuildContext context) => LoginIntBloc(),
        ),
        BlocProvider<AppBarStringBloc>(
          create: (BuildContext context) => AppBarStringBloc(),
        ),
      ],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            scrollBehavior: MyCustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
            title: 'CoVaMS',
            theme: lightThemeData,
            darkTheme: darkThemeData,
            themeMode: currentMode,
            home: const CovamsHomePage(),
            // home: const AdminPage(),
            // home: const VerifCentPage(),
          );
        },
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
