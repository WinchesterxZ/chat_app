import 'package:chat_app/core/functions/functions.dart';
import 'package:chat_app/core/strings.dart';
import 'package:chat_app/presentation/widgets/custom_button_widget.dart';
import 'package:chat_app/presentation/widgets/custom_icon_widget.dart';
import 'package:chat_app/presentation/widgets/custom_logo.dart';
import 'package:chat_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordVerifyController = TextEditingController();

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Expanded(flex: 1, child: CustomLogo()),
            Expanded(
              flex: 4,
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
                          'Create An account',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CustomTextField(
                          controller: _usernameController,
                          labelText: 'Username',
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
                      ValueListenableBuilder(
                          valueListenable: _obscurePassword,
                          builder: (context, value, child) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: CustomTextField(
                                controller: _passwordVerifyController,
                                obscureText: value,
                                labelText: 'Confirm Password',
                                suffixIcon: IconButton(
                                  onPressed: _tooglePasswordVisability,
                                  icon: Icon(
                                    value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                validator: validatePassword,
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButtonWidget(
                          buttonText: 'Sign Up', onPressed: _submit),
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
          ],
        ),
      ),
    );
  }
}
