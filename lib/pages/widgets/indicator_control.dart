import 'package:flutter/material.dart';

import 'dot_indicator.dart';

class IndicatorControl extends StatelessWidget {
  const IndicatorControl({
    super.key,
    required this.actual,
  });

  final int actual;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => DotIndicator(positionIndex: index, currentIndex: actual),
      ),
    );
  }
}
