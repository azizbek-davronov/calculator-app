import 'package:calculator_app/calculator_screen.dart';
import 'package:calculator_app/converter_screen.dart';
import 'package:calculator_app/history_screen.dart';
import 'package:calculator_app/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 72,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.calculate), label: 'Calculator'),
            NavigationDestination(
                icon: Icon(CupertinoIcons.arrow_right_arrow_left), label: 'Converter'),
            NavigationDestination(icon: Icon(Icons.history),   label: 'History'),
            NavigationDestination(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  // observer variable
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    const CalculatorScreen(),
    const ConverterScreen(),
    const HistoryScreen(),
    const SettingsScreen()
  ];
}
