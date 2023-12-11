import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style/common_style.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:flutter_application_1/seections/home/views/screens/home_screen.dart';
import 'package:flutter_application_1/seections/lamp/views/screens/lamp_screen.dart';
import 'package:flutter_application_1/seections/setting/views/screens/setting_screen.dart';
import 'package:flutter_application_1/seections/sign_up/views/screens/sign_up_screen.dart';
import 'package:flutter_application_1/seections/splash/views/screens/splash_screen.dart';
import 'common/widgets/basicLogger.dart';
import 'firebase/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  firebaseInit();
  runApp(
    GetMaterialApp(
      initialRoute: 'setting',
      routes: {
        Routes.home.routerName: (BuildContext context) => const HomeScreen(),
        Routes.setting.routerName: (BuildContext context) => const SettingScreen(),
        Routes.lamp.routerName: (BuildContext context) => const LampScreen(),
        Routes.splash.routerName: (BuildContext context) => const SplashScreen(),
        Routes.signUp.routerName: (BuildContext context) => const SignUpScreen(),
      },
      home: const MyApp(),
    ),
  );
}

void firebaseInit() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  logger.d('=======파이어베이스 초기화');
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
          body: const SplashScreen(),
        );
      },
    );
  }
}
