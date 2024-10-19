import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_app_bar/custom_app_bar.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_drawer/custom_drawer.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_navigation_bar/custom_navigation_bar.dart';
import 'package:cosmos_pedia/cosmospedia/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/background.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(), // CustomAppBar defined in a separate file
        endDrawer: const CustomDrawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: whiteColor,
          shape: const CircleBorder(),
          onPressed: () {
            // Handle FAB press
          },
          child: const Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomNavigationBar(), // Custom bottom navigation bar
      ),
    );
  }
}
