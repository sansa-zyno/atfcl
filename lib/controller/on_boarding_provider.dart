import 'package:flutter/material.dart';
import 'package:atfcl_fintech/models/onboarding_model.dart';

class OnboardingProvider extends ChangeNotifier {
  int selectedPageIndex = 0;
  //bool get isLastPage => selectedPageIndex.value == onBoardingList.length - 1;
  var pageController = PageController();
  List<OnboardingModel> onBoardingList = [
    OnboardingModel(
        "assets/images/loan.png",
        "Send, receive, and manage your money all in one place.",
        "Effortlessly send money, receive from anywhere and fund your wallet conveniently."),
    OnboardingModel(
        "assets/images/saveandinvest2.png",
        "Invest and save your money for future plans",
        "Take advantage of our high-yield savings accounts to invest and watch your money grow."),
    OnboardingModel(
        "assets/images/udesign.png",
        "Borrow loan for your financial assistance",
        "From stocks and bonds to mutual funds, our platform provides a range of options to suit your goals."),
  ];

  setPage(int i) {
    selectedPageIndex = i;
    notifyListeners();
  }
}
