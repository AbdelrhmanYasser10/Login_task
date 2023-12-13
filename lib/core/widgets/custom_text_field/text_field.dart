import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Icon prefixIcon;
  final String hintText;
  final String? Function(String?) validator;
  final bool isPassword;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    required this.validator,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            color: AppColors.kBorderColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            color: AppColors.kBorderColor,
            width: 1,
          ),
        ),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            color: AppColors.kButtonColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIconColor: AppColors.kHintColor,
        prefixIcon: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 25.0.w,
          ),
          child: prefixIcon,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.kHintColor,
        ),
      ),
      validator: validator,
      cursorColor: AppColors.kButtonColor,
    );
  }
}
