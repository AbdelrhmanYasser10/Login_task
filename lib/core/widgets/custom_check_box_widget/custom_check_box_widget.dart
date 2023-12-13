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
    return GestureDetector(
      onTap: (){
        setState(() {
          checked = !checked;
        });
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 7,
            backgroundColor: Colors.white,
            child: checked ? const Icon(
              Icons.check,
              color: AppColors.kCheckColor,
              size: 10,
            ):const SizedBox(),
          ),
          SizedBox(
            width: 5.0.w,
          ),
          Text(
            AppStrings.rememberMe,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
