import 'package:flutter/material.dart';
import 'package:flutter_ui_marry/dash_board/features/user_data/presentation/widgets/onboarding_card1.dart';
import 'package:flutter_ui_marry/dash_board/features/user_data/presentation/widgets/onboarding_card2.dart';
import 'package:flutter_ui_marry/dash_board/features/user_data/presentation/widgets/onboarding_card3.dart';
import 'package:flutter_ui_marry/dash_board/features/user_data/presentation/widgets/onboarding_card4.dart';

class OnboardingFlow extends StatefulWidget {
  @override
  _OnboardingFlowState createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingPage1(onNext: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          OnboardingPage2(onNext: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          OnboardingPage3(onNext: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          OnboardingPage4(onFinish: () {
            // Navigate to home or any other screen after submission
            Navigator.popUntil(context, ModalRoute.withName('/home'));
          }),
        ],
      ),
    );
  }
}
