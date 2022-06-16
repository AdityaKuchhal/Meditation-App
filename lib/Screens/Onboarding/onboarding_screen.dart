import 'package:flutter/material.dart';
import 'package:meditation/Components/pallete.dart';
import 'package:meditation/Screens/Onboarding/onboarding_comp.dart';

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
      desc: 'Find a suitable music for yourself to stay focused more easily',
      image: intro1,
    ),
    OnboardingComponents(
      title: 'Take a Deep Breath',
      desc: 'Start your mindfulness journey with our meditation program',
      image: intro2,
    ),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                  color: kPink,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                child: _containerPageAnimation()),
          ),
          _indicator(),
          _button(),
        ],
      ),
    );
  }

  Widget _containerPageAnimation() {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height / 70),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            _onBoardingPages[0].image,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100,
          ),
          Text(
            _onBoardingPages[0].title,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 32,
              color: kPrimaryColor,
              fontFamily: 'GilroyEBold',
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 250,
          ),
          Text(
            _onBoardingPages[0].desc,
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
  }

  Widget _indicator() {
    return Container();
  }

  Widget _button() {
    return InkWell(
      onTap: () {},
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
          child: Text(
            'Continue',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 40,
              fontFamily: 'GilroyEBold',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
