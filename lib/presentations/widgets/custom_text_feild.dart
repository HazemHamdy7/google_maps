import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bussniss_logic/phone_auth/phone_auth_cubit.dart';
import '../../constant/colors_app.dart';
import '../../constant/strings.dart';

// ignore: must_be_immutable
class CustomTextFeiled extends StatelessWidget {
  CustomTextFeiled({super.key});
  late String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.lightGray,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Text(
              '${generateCountryFlag()}+20',
              style: const TextStyle(fontSize: 18, letterSpacing: 2.0),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.blue,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: TextFormField(
              autofocus: true,
              style: const TextStyle(
                fontSize: 18,
                letterSpacing: 2.0,
              ),
              decoration: const InputDecoration(border: InputBorder.none),
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number!';
                } else if (value.length < 11) {
                  return 'Too short for a phone number!';
                }
                return null;
              },
              onSaved: (value) {
                phoneNumber = value!;
              },
            ),
          ),
        ),
      ],
    );
  }
}

// Future<void> _register(BuildContext context) async {
//   if (!_phoneFormKey.currentState!.validate()) {
//     Navigator.pop(context);
//     return;
//   } else {
//     Navigator.pop(context);
//     _phoneFormKey.currentState!.save();
//     BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber);
//   }
// }
