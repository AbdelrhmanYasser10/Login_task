import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task/core/utils/media_query_values.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class CustomTermsTextWidget extends StatelessWidget {
  const CustomTermsTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.166,
          vertical: 15.0.h
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: AppStrings.signingConfirmation,
          style: Theme.of(context).textTheme.bodySmall,
          children: [
            TextSpan(
              text: " ${AppStrings.termsServices}",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.kButtonColor
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
