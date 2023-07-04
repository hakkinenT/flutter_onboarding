import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class OnboardingSlide extends StatelessWidget {
  const OnboardingSlide(
      {super.key, required this.imageUrl, required this.text});

  final String imageUrl;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OnboardingImage(
          imageUrl: imageUrl,
        ),
        const SizedBox(
          height: 48,
        ),
        OnboardingText(
          text: text,
        )
      ],
    );
  }
}

class OnboardingText extends StatelessWidget {
  const OnboardingText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

class OnboardingImage extends StatelessWidget {
  const OnboardingImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AspectRatio(
      aspectRatio: size.width <= 541 ? 1 / 1 : 3.6,
      child: SvgPicture.asset(imageUrl),
    );
  }
}
