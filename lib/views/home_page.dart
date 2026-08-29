import 'package:flutter/material.dart';
import 'package:posts/helpers/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.backgroundBottom,
        selectedItemColor: AppColors.primaryYellow,
        unselectedItemColor: AppColors.lightGray,
        currentIndex: selectedIndex, // Set the initial selected index
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
          // Handle navigation based on the selected index
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      appBar: AppBar(title: const Text('Home Page')),
      body: const Center(child: Text('Welcome to the Home Page!')),
    );
  }
}
