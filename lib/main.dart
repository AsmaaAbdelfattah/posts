import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/views/home_page.dart';
import 'package:posts/views/login_page.dart';

void main() {
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
      home:  HomePage(),
    );
  }
}