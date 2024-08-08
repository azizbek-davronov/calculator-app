import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator_app/theme_provider.dart';
import 'package:social_media_buttons/social_media_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Chnage Theme:'),
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
              Column(
                children: [
                  const Text('Developed by Azizbek Davronov',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => launchUrl(
                            Uri.https('www.github.com', '/azizbek-davronov')),
                        icon: const Icon(
                          SocialMediaIcons.github_circled,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () => launchUrl(Uri.https(
                            'www.linkedin.com', '/in/aziz-davronov-a410212a3')),
                        icon: const Icon(
                          SocialMediaIcons.linkedin,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () => launchUrl(Uri.https(
                            'www.instagram.com', '/aziz.davronov.99')),
                        icon: const Icon(
                          SocialMediaIcons.instagram,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
