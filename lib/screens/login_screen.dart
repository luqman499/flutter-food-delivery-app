import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../constants/text_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding),
          child: Card(
            elevation: 0, // Removed shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo (Added icon back)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.restaurant, color: AppColors.black),
                      const SizedBox(width: AppSizes.smallPadding),
                      Text(
                        'hellofood',
                        style: AppTextStyles.heading.copyWith(
                          color: AppColors.orangeGradientStart,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.padding),
                  // Phone Number Field
                  const CustomTextField(
                    hintText: 'Phone number',
                    prefixIcon: Icons.phone,
                  ),
                  const SizedBox(height: AppSizes.smallPadding),
                  // Password Field
                  const CustomTextField(
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    showEyeIcon: true,
                  ),
                  const SizedBox(height: AppSizes.smallPadding),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget your password?',
                      style: AppTextStyles.body.copyWith(color: AppColors.grey),
                    ),
                  ),
                  const SizedBox(height: AppSizes.padding),
                  // Sign In Button (Full width)
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: 'SIGN IN',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/home',
                        ); // Navigate to Home screen
                      },
                    ),
                  ),
                  const SizedBox(height: AppSizes.padding),
                  // Or Divider
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.smallPadding,
                        ),
                        child: Text('Or', style: AppTextStyles.body),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: AppSizes.padding),
                  // Social Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.pink[100],
                        child: const Icon(Icons.facebook, color: Colors.pink),
                      ),
                      const SizedBox(width: AppSizes.padding),
                      CircleAvatar(
                        backgroundColor: Colors.pink[100],
                        child: const Icon(
                          Icons.g_mobiledata,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.padding),
                  // Sign Up Link
                  Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.orangeGradientStart,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
