import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task/core/utils/assets_manager.dart';

class CustomSocialButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color backgroundColor;
  final Color textColor;
  const CustomSocialButton({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.backgroundColor,
    required this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){

      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
            Size(double.infinity, 55.0.w)
        ),
        backgroundColor: MaterialStateProperty.all(
          backgroundColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 25.0.w,
            height: 25.0.h,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 15.0.w,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: textColor,
              fontSize: 14.sp
            ),
          ),
        ],
      ),
    );
  }
}
