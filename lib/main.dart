import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:posts/helpers/app_state.dart';
import 'package:posts/views/widgets/bottom_nav_bar.dart';
import 'package:posts/views/login_page.dart';

Future<void> main() async {
  await GetStorage.init(); // Initialize GetStorage before running the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Posts',
      debugShowCheckedModeBanner: false,
      home: getxStorage.read('isLoggedIn') == true ? const BottomNavigationBar() :  LoginPage(),
    );
  }
}