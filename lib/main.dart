import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/enum/storage_manager_key.dart';
import 'package:flutter_application_1/common/style/common_style.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:flutter_application_1/seections/home/views/screens/home_screen.dart';
import 'package:flutter_application_1/seections/lamp/views/screens/lamp_screen.dart';
import 'package:flutter_application_1/seections/login/get_x/login_logic.dart';
import 'package:flutter_application_1/seections/setting/views/screens/setting_screen.dart';
import 'package:flutter_application_1/seections/sign_up/views/screens/sign_up_screen.dart';
import 'package:flutter_application_1/seections/splash/views/screens/splash_screen.dart';
import 'common/widgets/basic_logger.dart';
import 'common/widgets/basic_toast.dart';
import 'firebase/constants.dart';
import 'firebase/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInit();

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
      home: MyApp(),
    ),
  );
}

Future<void> firebaseInit() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> isUser() async {
  Future<String?> uid = storageManager.read(StorageManagerKey.uid.key);
  if (uid != null && uid != '') {
    Get.to<void>(() => const HomeScreen());
  } else {
    Get.to<void>(() => const SplashScreen());
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final LoginLogic loginLogic = Get.put(LoginLogic());

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
            // title: const Text('HOME'),
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                loginLogic.signOut();
              },
            ),
          ),
          body: StreamBuilder(
            stream: firebaseAuth.authStateChanges(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return const HomeScreen();
              } else {
                return const SplashScreen();
              }
            },
          ),
        );
      },
    );
  }
}
