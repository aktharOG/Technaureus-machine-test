import 'package:adhoc/exports_main.dart';
import 'package:adhoc/src/core/constants/app_images.dart';
import 'package:adhoc/src/presentation/widgets/app_space_widget.dart';
import 'package:adhoc/src/presentation/widgets/custom_button.dart';
import 'package:adhoc/src/presentation/widgets/custom_text.dart';
import 'package:adhoc/src/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Login'),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logo,
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomTextfield(
                        height: 45,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColors.primary,
                        ),
                        name: "Username",
                        controller: TextEditingController(),
                      ),
                      setHeight(10),
                      CustomTextfield(
                          height: 45,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColors.primary,
                        ),
                        controller: TextEditingController(),
                        name: "Password",
                      ),

                      setHeight(20),

                      CustomButton(label: "Login",
                      borderRadius: BorderRadius.circular(10),
                      onPressed: () {
                        
                      },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
