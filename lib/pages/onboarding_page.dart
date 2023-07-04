import 'package:flutter/material.dart';
import 'package:flutter_onboarding/pages/home_page.dart';

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
                child: Row(
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
                ),
              ),
            actual != 2
                ? Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomePage(),
                            ),
                          );
                        },
                        child: const Text('Skip'),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            final next = actual + 1;
                            controller.jumpToPage(next);
                          });
                        },
                        child: const Text('Next'),
                      ),
                    ],
                  )
                : SizedBox(
                    width: double.maxFinite,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Entrar',
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

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
