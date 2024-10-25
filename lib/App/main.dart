import 'package:codelabmodul3pemmob/App/Controller/AuthController.dart';
import 'package:codelabmodul3pemmob/App/Page/HomePage.dart';
import 'package:codelabmodul3pemmob/App/Page/LoginPage.dart';
import 'package:codelabmodul3pemmob/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    ),
    initialRoute: _authController.isLoggedIn.value ? '/home' : '/login',
    getPages: [GetPage(name: '/login', page: () => LoginPage()),
      GetPage(name: '/home', page: () => HomePage()),
    ],
    );
  }
}