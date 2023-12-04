import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style/common_style.dart';
import 'package:flutter_application_1/seections/home/views/screens/home_screen.dart';
import 'package:flutter_application_1/seections/setting/views/screens/setting_screen.dart';
import 'firebase/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  firebaseInit();
  runApp(
    MaterialApp(
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomeScreen(),
        "/setting": (context) => const SettingScreen(),
      },
      home: const MyApp(),
    ),
  );
}

void firebaseInit() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, context) {
        return Scaffold(
          backgroundColor: commonBackground,
          appBar: AppBar(
            backgroundColor: commonBackground,
            title: const Text('HOME'),
            leading: const IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          ),
          body: const HomeScreen(),
        );
      },
    );
  }
}
