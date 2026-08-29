import 'package:flutter/material.dart';
import 'package:posts/helpers/app_color.dart';
import 'package:posts/views/favourite_page.dart';
import 'package:posts/views/home_page.dart';
import 'package:posts/views/settings_page.dart';

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({super.key});

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {

  int selectedIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const FavouritePage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: AppColors.backgroundBottom,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: AppColors.lightGray,
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, -3), // Shadow position
              ),
            ],
          ),
          child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: selectedIndex == 0 ? AppColors.primaryYellow  : AppColors.gray,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: selectedIndex == 1 ? AppColors.primaryYellow : AppColors.gray,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person,
                      color: selectedIndex == 2 ? AppColors.primaryYellow : AppColors.gray,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                ],
              ),),)
            );
  }
}
