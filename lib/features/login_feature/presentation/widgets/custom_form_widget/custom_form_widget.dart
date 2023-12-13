import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task/features/login_feature/presentation/manager/login_cubit/login_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_button_widget/custom_button_widget.dart';
import '../../../../../core/widgets/custom_check_box_widget/custom_check_box_widget.dart';
import '../../../../../core/widgets/custom_loading_widget/custom_loading_widget.dart';
import '../../../../../core/widgets/custom_text_field/text_field.dart';


class CustomFormWidget extends StatefulWidget {
  const CustomFormWidget({Key? key}) : super(key: key);

  @override
  State<CustomFormWidget> createState() => _CustomFormWidgetState();
}

class _CustomFormWidgetState extends State<CustomFormWidget> {
  // controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _verticalSpace(),
          CustomTextField(
            controller: _emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Email must not be empty";
              }
              return null;
            },
            prefixIcon: const Icon(Icons.email_outlined),
            hintText: AppStrings.emailHintText,
          ),
          _verticalSpace(),
          CustomTextField(
            controller: _passwordController,
            isPassword: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "Password must not be empty";
              }
              return null;
            },
            prefixIcon: const Icon(Icons.lock_outline),
            hintText: AppStrings.passwordHintText,
          ),

          //Adding some vertical padding on the row
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 7.0.h,
            ),
            child: Row(
              children: [
                const CustomCheckBoxWidget(),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    AppStrings.forgetPassword,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kForgetPasswordColor,
                        ),
                  ),
                ),
              ],
            ),
          ),
          _verticalSpace(),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = LoginCubit.get(context);
              return  state is LoginLoading ? const Center(
                child: CustomLoadingIndicator(),
              ):CustomButtonWidget(
                color: AppColors.kButtonColor,
                text: AppStrings.loginTxt,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    cubit.login(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  SizedBox _verticalSpace() {
    return SizedBox(
      height: 20.0.w,
    );
  }
}
