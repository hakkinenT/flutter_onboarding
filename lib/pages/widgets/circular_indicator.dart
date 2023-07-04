import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
    this.width = 10,
    this.height = 10,
    required this.positionIndex,
    required this.currentIndex,
  });

  final double width;
  final double height;
  final int positionIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: positionIndex == currentIndex ? width * 2 : width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.green,
      ),
    );
  }
}
