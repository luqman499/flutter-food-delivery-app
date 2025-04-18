import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../constants/text_styles.dart';
import '../utils/cart_manager.dart';
import '../widgets/custom_button.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({super.key});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String title;
  late String price;
  late String imagePath;
  int quantity = 1; // Added to track quantity

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Extract arguments passed from HomeScreen
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    title = arguments['title'] ?? 'Food Item';
    price = arguments['price'] ?? '\$0.00';
    imagePath = arguments['imagePath'] ?? '';

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Food Image
            Image.asset(
              imagePath,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text(
                      'Image not found',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food Title and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: AppTextStyles.heading),
                      Text(price, style: AppTextStyles.heading),
                    ],
                  ),
                  const SizedBox(height: AppSizes.smallPadding),
                  // Restaurant Name
                  Text(
                    'by Hut',
                    style: AppTextStyles.body.copyWith(color: AppColors.grey),
                  ),
                  const SizedBox(height: AppSizes.padding),
                  // Add to Bag Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                          ),
                          Text('$quantity'),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 150,
                        child: CustomButton(
                          text: 'Add To Bag',
                          onPressed: () {
                            CartManager.addToCart({
                              'title': title,
                              'price': price,
                              'imagePath': imagePath,
                              'quantity': quantity,
                            });
                            // Navigate to CartScreen after adding
                            Navigator.pushNamed(context, '/cart');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.padding),
                  // Tabs
                  TabBar(
                    controller: _tabController,
                    labelColor: AppColors.black,
                    unselectedLabelColor: AppColors.grey,
                    indicatorColor: AppColors.orangeGradientStart,
                    tabs: const [
                      Tab(text: 'Food Details'),
                      Tab(text: 'Food Reviews'),
                    ],
                  ),
                  const SizedBox(height: AppSizes.padding),
                  // Tab Content
                  SizedBox(
                    height: 200,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Text(
                          'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.',
                          style: AppTextStyles.body,
                        ),
                        Text('No reviews yet.', style: AppTextStyles.body),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSizes.padding),
                  // Delivery Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Icon(Icons.access_time, color: AppColors.grey),
                          const SizedBox(height: AppSizes.smallPadding),
                          Text('12:30pm', style: AppTextStyles.body),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.directions_bike,
                            color: AppColors.grey,
                          ),
                          const SizedBox(height: AppSizes.smallPadding),
                          Text('3.5 km', style: AppTextStyles.body),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.map, color: AppColors.grey),
                          const SizedBox(height: AppSizes.smallPadding),
                          Text(
                            'Map View',
                            style: AppTextStyles.body.copyWith(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.delivery_dining,
                            color: AppColors.grey,
                          ),
                          const SizedBox(height: AppSizes.smallPadding),
                          Text('Delivery', style: AppTextStyles.body),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
