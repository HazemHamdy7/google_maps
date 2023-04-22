import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../constant/colors_app.dart';

class Otp extends StatelessWidget {
  Otp({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
          child: PinCodeTextField(
            appContext: context,
            autoFocus: true,
            cursorColor: Colors.black,
            keyboardType: TextInputType.number,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(15),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: AppColors.lightblue,
              inactiveColor: AppColors.lightGray,
              inactiveFillColor: Colors.white,
              selectedColor: AppColors.lightblue,
              selectedFillColor: Colors.white,
            ),
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.white,
            enableActiveFill: true,
            onCompleted: (v) {
              debugPrint("Completed");
            },
            onChanged: (value) {
              debugPrint(value);
            },
            beforeTextPaste: (text) {
              debugPrint("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          )),
    );
  }
}
