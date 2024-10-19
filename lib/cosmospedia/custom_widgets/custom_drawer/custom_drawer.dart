import 'package:cosmos_pedia/cosmospedia/authentication/screen/sign_in_screen.dart';
import 'package:cosmos_pedia/cosmospedia/authentication/services/auth_services.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_list_tile/custom_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Account Settings'),
            onTap: () {
              // Handle Home tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            onTap: () {
              // Handle Settings tap
            },
          ),
          CustomListTile(
            leadingWidget: const Icon(CupertinoIcons.doc_on_clipboard_fill),
            titleString: "Term and Conditions",
            onTapFunction: () {},
          ),
          CustomListTile(
            leadingWidget: const Icon(Icons.support_agent_rounded),
            titleString: "Help and Support",
            onTapFunction: () {},
          ),
          CustomListTile(
            leadingWidget: const Icon(Icons.logout_rounded),
            titleString: 'Logout',
            onTapFunction: () async {
              final navigator = Navigator.of(context);
              await AuthServices().signOut();
              navigator.pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
