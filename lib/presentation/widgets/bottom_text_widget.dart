import 'package:flutter/material.dart';

class BottomTextWidget extends StatelessWidget {
  const BottomTextWidget({super.key, required this.haveAccount, required this.sign, required this.onTap});


  final String haveAccount;
  final String sign;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          haveAccount,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            sign,
            style: const TextStyle(
                color: Color(0xff1e319d), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
