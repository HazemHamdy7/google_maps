import 'package:flutter/material.dart';

import '../../constant/colors_app.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key, required this.phoneNumber});

  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'Enter your 6 digit numbers send to  ',
          style:
              const TextStyle(color: Colors.black, fontSize: 18, height: 1.4),
          children: [
            TextSpan(
              text: phoneNumber,
              style: const TextStyle(color: AppColors.blue),
            )
          ]),
    );
  }
}
