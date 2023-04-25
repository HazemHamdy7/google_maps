// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../constant/strings.dart';
import '../widgets/CustomRichText.dart';
import '../widgets/custom_Text_inetFace.dart';
import '../widgets/custom_botton.dart';
import '../widgets/otp.dart';

class OtpScreen extends StatelessWidget {
  final String? phoneNumer;

  const OtpScreen({
    Key? key,
    this.phoneNumer,
    Object? phoneNumber,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextInterFace(
                  text1: 'What is your phone number', text2: '',
                  // text2: 'Enter your 6 digit numbers send to',
                ),
                CustomRichText(
                  phoneNumber: '$phoneNumer',
                ),
                const SizedBox(height: 90),
                Otp(),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Verify',
                  onPressed: () {
                    {
                      Navigator.pushNamed(context, mapScreen);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
