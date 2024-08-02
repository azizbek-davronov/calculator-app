import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator_app/theme_provider.dart';
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
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Consumer<ThemeProvider>(
                        builder: (context, themeProvider, child) {
                          return Switch(
                              inactiveTrackColor: Colors.transparent,
                              inactiveThumbColor: Colors.orange,
                              thumbIcon: WidgetStatePropertyAll(
                                themeProvider.isSelected
                                    ? const Icon(Icons.nights_stay)
                                    : const Icon(Icons.sunny),
                              ),
                              value: themeProvider.isSelected,
                              onChanged: (value) {
                                themeProvider.toggleTheme();
                              });
                        },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text(
                    'History',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'Settings',
                    style: TextStyle(fontSize: 14),
                  ),
                  onTap: () {},
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
