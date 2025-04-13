import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../constants/text_styles.dart';
import '../widgets/category_chip.dart';
import '../widgets/food_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: AppColors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'What would you like to eat?',
                  style: AppTextStyles.heading,
                ),
                const SizedBox(height: AppSizes.padding),
                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'What would you like to buy?',
                    prefixIcon: const Icon(Icons.search, color: AppColors.grey),
                    suffixIcon: const Icon(
                      Icons.filter_list,
                      color: AppColors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: AppSizes.padding),
                // Categories
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CategoryChip(
                        label: 'Burger',
                        icon: Icons.fastfood,
                        isSelected: false,
                      ),
                      CategoryChip(
                        label: 'Sushi',
                        icon: Icons.rice_bowl,
                        isSelected: false,
                      ),
                      CategoryChip(
                        label: 'Pizza',
                        icon: Icons.local_pizza,
                        isSelected: false,
                      ),
                      CategoryChip(
                        label: 'Cake',
                        icon: Icons.cake,
                        isSelected: false,
                      ),
                      CategoryChip(
                        label: 'Ice Cream',
                        icon: Icons.icecream,
                        isSelected: false,
                      ),
                      CategoryChip(
                        label: 'Soft',
                        icon: Icons.local_drink,
                        isSelected: false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.padding),
                // Popular Foods Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular Foods', style: AppTextStyles.subheading),
                    Text(
                      'See all',
                      style: AppTextStyles.body.copyWith(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.padding),
                // Popular Foods Grid
                // Inside the Popular Foods GridView
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: AppSizes.padding,
                  mainAxisSpacing: AppSizes.padding,
                  childAspectRatio: 0.65,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/food_details',
                          arguments: {
                            'title': 'Fried Egg',
                            'price': '\$15.06',
                            'imagePath': 'images/recipe.jpg',
                          },
                        );
                      },
                      child: const FoodCard(
                        title: 'Fried Egg',
                        price: '\$15.06',
                        imagePath: 'images/recipe.jpg',
                        rating: 4.9,
                        reviewCount: 200,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/food_details',
                          arguments: {
                            'title': 'Mixed Vegetable',
                            'price': '\$17.03',
                            ' imagePath': 'images/recipe.jpg',
                          },
                        );
                      },
                      child: const FoodCard(
                        title: 'Mixed Vegetable',
                        price: '\$17.03',
                        imagePath: 'images/recipe.jpg',
                        rating: 4.9,
                        reviewCount: 100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.padding),
                // Best Foods Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Best Foods', style: AppTextStyles.subheading),
                    Text(
                      'See all',
                      style: AppTextStyles.body.copyWith(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.padding),
                // Best Foods Grid
                // Inside the Best Foods GridView
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: AppSizes.padding,
                  mainAxisSpacing: AppSizes.padding,
                  childAspectRatio: 0.65,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/food_details',
                          arguments: {
                            'title': 'Best Food 1',
                            'price': '\$20.00',
                            'imagePath': 'images/recipe.jpg',
                          },
                        );
                      },
                      child: const FoodCard(
                        title: 'Best Food 1',
                        price: '\$20.00',
                        imagePath: 'images/recipe.jpg',
                        rating: 4.8,
                        reviewCount: 150,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/food_details',
                          arguments: {
                            'title': 'Best Food 2',
                            'price': '\$22.00',
                            'imagePath': 'images/recipe.jpg',
                          },
                        );
                      },
                      child: const FoodCard(
                        title: 'Best Food 2',
                        price: '\$22.00',
                        imagePath: 'images/recipe.jpg',
                        rating: 4.7,
                        reviewCount: 120,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSizes.padding,
                ), // Extra padding at the bottom
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Near By',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        selectedItemColor: AppColors.orangeGradientStart,
        unselectedItemColor: AppColors.grey,
        showUnselectedLabels: true,
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation later
        },
      ),
    );
  }
}
