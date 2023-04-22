// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            maximumSize: const Size(110, 50),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            )),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
