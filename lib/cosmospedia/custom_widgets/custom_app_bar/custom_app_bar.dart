import 'package:cosmos_pedia/cosmospedia/utils/constants.dart';
import 'package:cosmos_pedia/cosmospedia/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      excludeHeaderSemantics: true,
      backgroundColor: transparent,
      foregroundColor: transparent,
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      title: Text(
        "CosmosPedia",
        style: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.devicePixelRatio(20),
        ),
      ),
      actions: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications),
              color: whiteColor,
              onPressed: () {
                // Handle notification icon tap
              },
            ),
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                color: whiteColor,
                onPressed: () {
                  Scaffold.of(context).openEndDrawer(); // Open the end drawer
                },
              ),
            ),
            SizedBox(
              width: SizeConfig.width(5),
            ),
            // Add padding to the right for better spacing
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
