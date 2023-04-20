import 'package:flutter/material.dart';

class CustomTextInterFace extends StatelessWidget {
  const CustomTextInterFace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'What is your phonr number',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: const Text(
            'Please enter your phone number to verify your account',
            style: TextStyle(
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
