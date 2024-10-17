import 'package:cosmos_pedia/cosmospedia/utils/constants.dart';
import 'package:cosmos_pedia/cosmospedia/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: whiteColor,
      height: SizeConfig.height(8),
      shape: const CircularNotchedRectangle(),
      notchMargin: SizeConfig.devicePixelRatio(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.event),
            color: blackColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.cloud),
            color: blackColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.note_alt),
            color: blackColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.image),
            color: blackColor,
          ),
        ],
      ),
    );
  }
}
