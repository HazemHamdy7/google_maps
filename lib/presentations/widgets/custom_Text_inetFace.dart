// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextInterFace extends StatelessWidget {
  const CustomTextInterFace({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  final String text1;
  final String? text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          // 'What is your phonr number',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            text2!,
            // 'Please enter your phone number to verify your account',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
