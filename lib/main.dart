import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style/common_style.dart';
import 'package:flutter_application_1/common/widgets/text_widget/body_gray_text.dart';
import 'package:flutter_application_1/common/widgets/text_widget/body_text.dart';
import 'package:flutter_application_1/common/widgets/text_widget/head_text.dart';
import 'package:flutter_application_1/seections/home/views/screens/home_screen.dart';
import 'package:flutter_application_1/seections/home/views/widgets/header_swith.dart';
import 'common/assets/icons/common_icons.dart';
import 'firebase/firebase_options.dart';

void main() {
  firebaseInit();
  runApp(
    MaterialApp(
      home: MyApp(),
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
        body: HomeScreen());
  }
}
