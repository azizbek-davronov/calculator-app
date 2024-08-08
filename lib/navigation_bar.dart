import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  accountName: const Text(
                    'Aziz Davronov',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  accountEmail: const Text(
                    'aziz.shuxratovich@gmail.com',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  onDetailsPressed: () {},
                ),
              ],
            ),
          ),
          const Align(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              children: [
                Text(
                  'Developed by Aziz Davronov',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton.github(),
                    SocialMediaButton.linkedin(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
