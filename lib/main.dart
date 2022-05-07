import 'package:emmi/constants.dart';
import 'package:emmi/constants/auth_controller.dart';
import 'package:emmi/ui/screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:emmi/ui/component.dart';
import 'package:emmi/ui/screen/crypto_home_page.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wallet Cryptocurrency',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

