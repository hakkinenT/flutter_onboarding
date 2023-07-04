import 'package:flutter/material.dart';

import '../home_page.dart';

class GoToHomeButton extends StatelessWidget {
  const GoToHomeButton({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
      },
      child: Text(label),
    );
  }
}
