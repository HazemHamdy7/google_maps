import 'package:flutter/material.dart';
import '../widgets/custom_Text_inetFace.dart';
import '../widgets/custom_botton.dart';
import '../widgets/custom_text_feild.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: UniqueKey(),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 88,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextInterFace(),
                  const SizedBox(height: 110),
                  CustomTextFeiled(),
                  const SizedBox(height: 30),
                  const CustomButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
