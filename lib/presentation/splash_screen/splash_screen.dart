import 'package:chat_app/core/colors.dart';
import 'package:chat_app/core/functions/functions.dart';
import 'package:chat_app/core/strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3) ,() {
      customNavigation(context, AppStrings.loginScreenRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(child: Lottie.asset(AppStrings.splasIcon)),
    );
  }
}
