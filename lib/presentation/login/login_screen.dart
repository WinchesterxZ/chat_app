import 'dart:developer';

import 'package:chat_app/core/colors.dart';
import 'package:chat_app/core/functions/functions.dart';
import 'package:chat_app/core/strings.dart';
import 'package:chat_app/presentation/widgets/bottom_text_widget.dart';
import 'package:chat_app/presentation/widgets/custom_button_widget.dart';
import 'package:chat_app/presentation/widgets/custom_icon_widget.dart';
import 'package:chat_app/presentation/widgets/custom_logo.dart';
import 'package:chat_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  void _tooglePasswordVisability() {
    _obscurePassword.value = !_obscurePassword.value;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with login logic
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Expanded(flex: 2, child: CustomLogo()),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Text(
                          'Log in to your account',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CustomTextField(
                          controller: _emailController,
                          labelText: 'Email',
                          validator: validateEmail,
                        ),
                      ),
                      ValueListenableBuilder(
                          valueListenable: _obscurePassword,
                          builder: (context, value, child) {
                            return CustomTextField(
                              controller: _passwordController,
                              obscureText: value,
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                onPressed: _tooglePasswordVisability,
                                icon: Icon(
                                  value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              validator: validatePassword,
                            );
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButtonWidget(
                        buttonText: 'Sign In',
                        onPressed: _submit,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomIconWidget(
                      onTap: () {}, iconPath: AppStrings.googleLogo),
                  CustomIconWidget(
                      onTap: () {}, iconPath: AppStrings.facebookLogo),
                  CustomIconWidget(
                      onTap: () {}, iconPath: AppStrings.twitterLogo),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                  child: BottomTextWidget(
                haveAccount: "Don't Have An Account ?",
                sign: 'Sign Up',
                onTap: () {
                  customNavigation(context, AppStrings.signUpScreenRoute);
                },
              )),
            )
          ],
        ),
      ),
    );
  }
}
