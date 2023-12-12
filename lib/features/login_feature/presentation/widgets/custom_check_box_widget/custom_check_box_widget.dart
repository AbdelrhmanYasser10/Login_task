import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class CustomCheckBoxWidget extends StatefulWidget {
  const CustomCheckBoxWidget({Key? key,}) : super(key: key);

  @override
  State<CustomCheckBoxWidget> createState() => _CustomCheckBoxWidgetState();
}

class _CustomCheckBoxWidgetState extends State<CustomCheckBoxWidget> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: checked,
          onChanged: (value) {
            setState(() {
              checked = value!;
            });
          },
          fillColor: MaterialStateProperty.all(
            Colors.white,
          ),
          shape:const CircleBorder(),
          activeColor: AppColors.kCheckColor,
          checkColor: AppColors.kCheckColor,
        ),
        Text(
          AppStrings.rememberMe,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 13.sp
          ),
        ),
      ],
    );
  }
}
