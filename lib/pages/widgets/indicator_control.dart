import 'package:flutter/material.dart';

import 'circular_indicator.dart';

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
      children: List.generate(3, (index) {
        return Column(
          children: [
            CircularIndicator(
              positionIndex: index,
              currentIndex: actual,
            ),
            SizedBox(
              width: actual == index ? 25 : 20,
            )
          ],
        );
      }),
    );
  }
}
