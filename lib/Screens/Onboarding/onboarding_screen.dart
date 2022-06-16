import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: _containerPageAnimation(),
            ),
            _indicator(),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _containerPageAnimation() {
    return Container();
  }

  Widget _indicator() {
    return Container();
  }

  Widget _button() {
    return Container();
  }
}
