import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task/core/servcies/cache_helper/cache_keys/cache_keys.dart';
import 'package:login_task/core/servcies/cache_helper/cache_servcies.dart';
import 'package:login_task/core/utils/media_query_values.dart';
import 'package:login_task/features/login_feature/presentation/manager/login_cubit/login_cubit.dart';

import '../../../../core/functions/custom_snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/custom_form_widget/custom_form_widget.dart';
import '../widgets/custom_social_buttons_column/custom_social_buttons_column.dart';
import '../widgets/custom_terms_text_widget/custom_terms_text_widget.dart';
import '../widgets/cutom_title_widget/title_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginError){
          customSnackBar(
            context,
            state.message
          );
        }
        if(state is LoginSuccessfully){
          // Store token in cache for future usage
          SharedPreferencesHelper.saveData(
              key: SharedPreferencesKey.userToken,
              value: state.token,
          ).then((value){
            customSnackBar(
                context,
                "Login Successfully"
            );
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: _buildScreenBody(context),
          ),
        );
      },
    );
  }

  Widget _buildScreenBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0.w,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // First Space in UI
            SizedBox(
              width: double.infinity,
              height: context.height * 0.12,
            ),

            // Title Widget (Welcome back! ....)
            const CustomTitleWidget(),

            // MAIN form
            const CustomFormWidget(),

            //OR Text (padding space to make the same space)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 26.h,
              ),
              child: Text(
                AppStrings.orTxt,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            // All social buttons
            const SocialButtonsColumn(),

            // Have no Account ? Sign up
            _noAccountWidget(context),

            // Terms & Conditions
           const CustomTermsTextWidget(),

            _verticalSpace(),
          ],
        ),
      ),
    );
  }


  Row _noAccountWidget(BuildContext context)=>Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        AppStrings.noAccountText,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      TextButton(
        child: Text(
          AppStrings.signUpTxt,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.kButtonColor
          ),
        ),
        onPressed: () {
          //signup screen
        },
      )
    ],
  );


  SizedBox _verticalSpace()=> SizedBox(height: 20.0.h,);
}
