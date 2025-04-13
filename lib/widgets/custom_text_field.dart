import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final bool showEyeIcon; // Added to toggle eye icon visibility

  const CustomTextField({
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.showEyeIcon = false, // Default to false
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: AppColors.grey),
        suffixIcon:
            showEyeIcon
                ? Icon(
                  Icons.visibility,
                  color: AppColors.grey,
                ) // Added eye icon
                : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
