import 'package:flutter/material.dart';

Drawer customDrawer(){
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
          leading: const Icon(Icons.close),
          title: const Text('Terms & Conditions'),
          onTap: () {
            // Handle Settings tap
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Privacy Policies'),
          onTap: () {
            // Handle Settings tap
          },
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('Help & Support '),
          onTap: () {
            // Handle Settings tap
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout_sharp),
          title: const Text('Logout'),
          onTap: () {
            // Handle Settings tap
          },
        ),
      ],
    ),
  );
}