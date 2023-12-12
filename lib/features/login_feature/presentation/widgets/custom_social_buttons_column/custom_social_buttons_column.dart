import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task/core/utils/app_strings.dart';
import 'package:login_task/core/utils/assets_manager.dart';
import 'package:login_task/features/login_feature/presentation/widgets/custom_social_button/custom_social_button.dart';

import '../../../../../core/utils/app_colors.dart';

class SocialButtonsColumn extends StatelessWidget {
  const SocialButtonsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Google
        const CustomSocialButton(
            text: AppStrings.continueWithGoogle,
            imagePath: ImgAssets.google,
            backgroundColor: AppColors.kGoogleBackgroundColor,
            textColor: Colors.black,
        ),
        verticalSpace(),
        // Apple
        const CustomSocialButton(
          text: AppStrings.continueWithApple,
          imagePath: ImgAssets.apple,
          backgroundColor: AppColors.kAppleBackgroundColor,
          textColor: Colors.white,
        ),
        verticalSpace(),
        // Facebook
        const CustomSocialButton(
          text: AppStrings.continueWithFacebook,
          imagePath: ImgAssets.facebook,
          backgroundColor: AppColors.kFacebookBackgroundColor,
          textColor: Colors.white,
        ),
        verticalSpace(),
      ],
    );
  }
  SizedBox verticalSpace(){
    return SizedBox(
      height: 20.0.h,
    );
  }
}
