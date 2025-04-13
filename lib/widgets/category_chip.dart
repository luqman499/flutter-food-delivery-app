import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;

  const CategoryChip({
    required this.label,
    required this.icon,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.smallPadding),
      child: Chip(
        label: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppColors.white : AppColors.black,
            ),
            const SizedBox(width: AppSizes.smallPadding),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.black,
              ),
            ),
          ],
        ),
        backgroundColor:
            isSelected ? AppColors.orangeGradientStart : AppColors.white,
        elevation: isSelected ? AppSizes.cardElevation : 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
