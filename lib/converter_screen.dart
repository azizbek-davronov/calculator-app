import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Icon(CupertinoIcons.arrow_right_arrow_left)),
    );
  }
}
