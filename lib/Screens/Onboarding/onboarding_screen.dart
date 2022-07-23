import 'package:flutter/material.dart';
import 'package:meditation/Components/pallete.dart';
import 'package:meditation/Screens/Onboarding/onboarding_comp.dart';
import 'package:meditation/Screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Components/images.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingComponents> _onBoardingPages = [
    OnboardingComponents(
      title: 'Stay Focused',
      desc: 'To help you focus more readily, find some music that you enjoy',
      image: intro1,
    ),
    OnboardingComponents(
      title: 'Take a Deep Breath',
      desc: 'Start practising mindfulness with our online meditation programme',
      image: intro2,
    ),
  ];

  int currentIndex = 0;

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeIn,
      color: currentIndex == 0 ? kBlue : kPink,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeIn,
                    decoration: BoxDecoration(
                      color: currentIndex == 0 ? kBlue : kPink,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                    ),
                    child: _containerPageAnimation()),
              ),
              _indicator(),
              _button(),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _containerPageAnimation() {
    return PageView.builder(
      itemCount: _onBoardingPages.length,
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      controller: controller,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 70),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _onBoardingPages[index].image,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                _onBoardingPages[index].title,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 25,
                  color: kPrimaryColor,
                  fontFamily: 'GilroyEBold',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 150,
              ),
              Text(
                _onBoardingPages[index].desc,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 42,
                  color: Colors.white,
                  fontFamily: 'GilroyLight',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _indicator() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: SmoothPageIndicator(
        controller: controller,
        count: _onBoardingPages.length,
        effect: const ExpandingDotsEffect(
          dotHeight: 10,
          dotWidth: 12,
          dotColor: kBorderGrey,
          spacing: 10,
          activeDotColor: kPrimaryColor,
        ),
      ),
    );
  }

  Widget _button() {
    return GestureDetector(
      onTap: () {
        if (currentIndex == 0) {
          controller.animateToPage(
            1,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeIn,
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        height: 50,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(52, 63, 86, .2),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentIndex == 0 ? 'Continue' : 'Let\'s Go',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 40,
                    fontFamily: 'GilroyEBold',
                    color: Colors.white,
                  ),
                ),
                Icon(
                  currentIndex == 0 ? Icons.arrow_circle_right_outlined : Icons.arrow_circle_right,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
