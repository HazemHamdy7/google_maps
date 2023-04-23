import 'package:flutter/material.dart';
import 'package:google_maps/constant/strings.dart';
import '../widgets/custom_Text_inetFace.dart';
import '../widgets/custom_botton.dart';
import '../widgets/custom_text_feild.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _phoneFormKey,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 88,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextInterFace(
                    text1: 'What is your phone number',
                    text2:
                        'Please enter your phone number to verify your account',
                  ),
                  const SizedBox(height: 110),
                  CustomTextFeiled(),
                  const SizedBox(height: 30),
                  CustomButton(
                      onPressed: () {
                        Navigator.pushNamed(context, otpScreen);
                      },
                      text: 'Next'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
