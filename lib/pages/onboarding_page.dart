import 'package:flutter/material.dart';

import 'widgets/custom_elevated_button.dart';
import 'widgets/indicator_control.dart';
import 'widgets/next_button.dart';
import 'widgets/skip_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController controller;
  int actual = 0;
  late List<Widget> circularIndexes;

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: actual < 2 ? 7 : 9,
              child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  itemCount: 3,
                  onPageChanged: (index) {
                    setState(() {
                      actual = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text('Page $index'),
                    );
                  }),
            ),
            if (actual < 2)
              Expanded(
                flex: 1,
                child: IndicatorControl(actual: actual),
              ),
            actual != 2
                ? Row(
                    children: [
                      const SkipButton(),
                      const Spacer(),
                      NextButton(
                        onPressed: () {
                          setState(() {
                            final next = actual + 1;
                            controller.jumpToPage(next);
                          });
                        },
                      ),
                    ],
                  )
                : const CustomElevatedButton()
          ],
        ),
      ),
    );
  }
}
