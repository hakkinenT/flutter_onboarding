import 'package:flutter/material.dart';
import 'package:flutter_onboarding/pages/onboarding_slide.dart';

const String investimentImage = 'assets/images/investment_data.svg';
const String mobilePaymentImage = 'assets/images/mobile_payments.svg';
const String personalFinance = 'assets/images/personal_finance.svg';

List<Widget> pages = [
  const OnboardingSlide(
    imageUrl: personalFinance,
    text: 'Controle suas finanças pessoais',
  ),
  const OnboardingSlide(
      imageUrl: mobilePaymentImage, text: 'Faça pagamentos online'),
  const OnboardingSlide(
      imageUrl: investimentImage, text: 'Gerencie seus investimentos')
];
