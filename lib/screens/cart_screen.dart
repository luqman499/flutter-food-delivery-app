import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../constants/text_styles.dart';
import '../utils/cart_manager.dart';
import '../widgets/card_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get totalPrice {
    return CartManager.cartItems.fold(0.0, (sum, item) {
      final priceString =
          item['price']?.toString().replaceAll('\$', '') ?? '0.0';
      final price = double.tryParse(priceString) ?? 0.0;
      final quantity = (item['quantity'] as num?)?.toDouble() ?? 1.0;
      return sum + (price * quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Item Carts', style: AppTextStyles.heading),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: AppColors.black),
            onPressed: () {
              setState(() {
                CartManager.clearCart();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cart Items
            Text('Your Food Cart', style: AppTextStyles.subheading),
            const SizedBox(height: AppSizes.padding),
            Expanded(
              child:
                  CartManager.cartItems.isEmpty
                      ? const Center(child: Text('Cart is empty'))
                      : ListView.builder(
                        itemCount: CartManager.cartItems.length,
                        itemBuilder: (context, index) {
                          final item = CartManager.cartItems[index];
                          return CartItem(
                            title: item['title']?.toString() ?? 'Unknown Item',
                            price: item['price']?.toString() ?? '\$0.00',
                            imagePath: item['imagePath']?.toString() ?? '',
                            quantity: (item['quantity'] as num?)?.toInt() ?? 1,
                            onIncrement: () {
                              setState(() {
                                final currentQuantity =
                                    (item['quantity'] as num?)?.toInt() ?? 1;
                                CartManager.cartItems[index]['quantity'] =
                                    currentQuantity + 1;
                              });
                            },
                            onDecrement: () {
                              setState(() {
                                final currentQuantity =
                                    (item['quantity'] as num?)?.toInt() ?? 1;
                                if (currentQuantity > 1) {
                                  CartManager.cartItems[index]['quantity'] =
                                      currentQuantity - 1;
                                }
                              });
                            },
                            onRemove: () {
                              setState(() {
                                CartManager.cartItems.removeAt(index);
                              });
                            },
                          );
                        },
                      ),
            ),
            const SizedBox(height: AppSizes.padding),
            // Promo Code
            TextField(
              decoration: InputDecoration(
                hintText: 'Add Your Promo Code',
                suffixIcon: const Icon(Icons.local_offer, color: Colors.red),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: AppSizes.padding),
            // Price Breakdown
            if (CartManager.cartItems.isNotEmpty)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        CartManager.cartItems[0]['title']?.toString() ??
                            'Unknown Item',
                        style: AppTextStyles.body,
                      ),
                      Text(
                        '\$${CartManager.cartItems[0]['price']?.toString().replaceAll('\$', '') ?? '0.00'}',
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.smallPadding),
                  if (CartManager.cartItems.length > 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          CartManager.cartItems[1]['title']?.toString() ??
                              'Unknown Item',
                          style: AppTextStyles.body,
                        ),
                        Text(
                          '\$${CartManager.cartItems[1]['price']?.toString().replaceAll('\$', '') ?? '0.00'}',
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),
                  const SizedBox(height: AppSizes.padding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: AppTextStyles.subheading),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: AppTextStyles.subheading,
                      ),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: AppSizes.padding),
            // Payment Method
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Payment Method', style: AppTextStyles.subheading),
                Row(
                  children: [
                    const Icon(Icons.credit_card, color: AppColors.grey),
                    const SizedBox(width: AppSizes.smallPadding),
                    Text('Credit/Debit Card', style: AppTextStyles.body),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
