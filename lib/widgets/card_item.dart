import 'package:flutter/material.dart';
import '../constants/sizes.dart';
import '../constants/text_styles.dart';

class CartItem extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartItem({
    required this.title,
    required this.price,
    required this.imagePath,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.smallPadding),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: AppSizes.padding),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.subheading),
                const SizedBox(height: AppSizes.smallPadding),
                Text(price, style: AppTextStyles.subheading),
              ],
            ),
          ),
          // Quantity Controls
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: onDecrement,
              ),
              Text('$quantity'),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: Colors.red),
                onPressed: onIncrement,
              ),
            ],
          ),
          // Remove Button
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.grey),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
