import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../constants/text_styles.dart';

class FoodCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  final double rating;
  final int reviewCount;

  const FoodCard({
    required this.title,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.reviewCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSizes.cardElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Food Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSizes.smallPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(title, style: AppTextStyles.subheading),
                const SizedBox(height: AppSizes.smallPadding),
                // Rating
                Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.red, size: 16),
                    const SizedBox(width: 4),
                    Text('($reviewCount)', style: AppTextStyles.body),
                  ],
                ),
                const SizedBox(height: AppSizes.smallPadding),
                // Price
                Text(price, style: AppTextStyles.subheading),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
