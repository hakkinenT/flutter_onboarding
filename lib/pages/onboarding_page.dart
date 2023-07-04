import 'package:flutter/material.dart';
import 'package:flutter_onboarding/core/constants/constant.dart';

import 'widgets/go_to_home_button.dart';
import 'widgets/indicator_control.dart';
import 'widgets/next_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController controller;
  int actual = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  itemCount: 3,
                  onPageChanged: (index) {
                    setState(() {
                      actual = index;
                    });
                  },
                  itemBuilder: (context, index) => pages[index]),
            ),
            IndicatorControl(actual: actual),
            SizedBox(
              width: size.width < 600 ? double.maxFinite : size.width * 0.5,
              child: Row(
                children: [
                  if (actual != 2) const GoToHomeButton(label: 'Skip'),
                  const Spacer(),
                  actual != 2
                      ? NextButton(
                          onPressed: () {
                            setState(() {
                              controller.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn,
                              );
                            });
                          },
                        )
                      : const GoToHomeButton(
                          label: 'Done',
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
