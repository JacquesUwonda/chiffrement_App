import 'package:beiza_chadrack/premiere_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Beiza_Application());
}

class Beiza_Application extends StatelessWidget {
  const Beiza_Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PremierePage(),
    );
  }
}
