import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_us.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/essential_collection.dart';
import 'package:union_shop/sale_collection.dart';
import 'package:union_shop/auth_page.dart';
import 'package:union_shop/shop_menu.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/print_shack_text.dart';
import 'package:union_shop/print_shack_about.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutUsPage(),
        '/collections': (context) => const CollectionsPage(),
        '/collections/essential-range': (context) => const EssentialCollectionPage(),
        '/collections/sale-items': (context) => const SaleCollectionPage(),
        '/auth': (context) => const AuthPage(),
        '/print-shack/text': (context) => const PrintShackTextPage(),
        '/print-shack/about': (context) => const PrintShackAboutPage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      // Top banner
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        color: const Color(0xFF4d2963),
                        child: const Text(
                          'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),

                      // Header row with logo + centered nav
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => navigateToHome(context),
                              child: Image.network(
                                'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                                height: 48,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 48,
                                    height: 48,
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.image_not_supported, color: Colors.grey),
                                  );
                                },
                              ),
                            ),

                            const Spacer(),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(onPressed: () => navigateToHome(context), child: const Text('Home', style: TextStyle(color: Colors.black))),
                                const SizedBox(width: 8),
                                // Shop dropdown (desktop) / bottom-sheet (mobile)
                                const ShopMenu(),
                                const SizedBox(width: 8),
                                PopupMenuButton<int>(
                                  tooltip: 'The Print Shack',
                                  onSelected: (v) {
                                    if (v == 0) Navigator.pushNamed(context, '/print-shack/about');
                                    if (v == 1) Navigator.pushNamed(context, '/print-shack/text');
                                  },
                                  itemBuilder: (_) => const [
                                    PopupMenuItem<int>(value: 0, child: Text('About')),
                                    PopupMenuItem<int>(value: 1, child: Text('Personalisation')),
                                  ],
                                  child: const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0), child: Text('The Print Shack', style: TextStyle(color: Colors.black))),
                                ),
                                const SizedBox(width: 8),
                                TextButton(onPressed: placeholderCallbackForButtons, child: const Text('SALE!', style: TextStyle(color: Colors.black))),
                                const SizedBox(width: 8),
                                TextButton(onPressed: () => Navigator.pushNamed(context, '/about'), child: const Text('About', style: TextStyle(color: Colors.black))),
                                const SizedBox(width: 8),
                                TextButton(onPressed: placeholderCallbackForButtons, child: const Text('UPSU.net', style: TextStyle(color: Colors.black))),
                              ],
                            ),

                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Hero Section
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      // Background image
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'assets/images/university_shirt-man.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ),
                      // Content overlay
                      Positioned(
                        left: 24,
                        right: 24,
                        top: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Essential Range - Over 20% OFF!',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "Over 20% off our essential range. Come and Grab yours while stocks last! ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),
                            ElevatedButton(
                              onPressed: placeholderCallbackForButtons,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4d2963),
                                foregroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              child: const Text(
                                'BROWSE PRODUCTS',
                                style: TextStyle(fontSize: 14, letterSpacing: 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Products Section
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        const Text(
                          'PRODUCTS SECTION',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 48),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount:
                              MediaQuery.of(context).size.width > 600 ? 2 : 1,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 48,
                          children: const [
                            ProductCard(
                              title: 'University Hoodie',
                              price: '£15.00',
                              imageUrl:
                                  'assets/images/university_hoodie.png',
                            ),
                            ProductCard(
                              title: 'University T-Shirt',
                              price: '£10.00',
                              imageUrl:
                                  'assets/images/university_t-shirt.png',
                            ),
                            ProductCard(
                              title: 'University Lanyard',
                              price: '£7.00',
                              imageUrl:
                                  'assets/images/university_lanyard.png',
                            ),
                            ProductCard(
                              title: 'University Joggers',
                              price: '£15.00',
                              imageUrl:
                                  'assets/images/university_joggers.png',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Footer
                Container(
                  width: double.infinity,
                  color: Colors.grey[50],
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isNarrow = constraints.maxWidth < 800;
                      Widget openingHours = const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Opening Hours', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                          SizedBox(height: 12),
                          Text('❄️ Winter Break Closure Dates ❄️', style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Text('Closing 4pm 19/12/2025', style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Text('Reopening 10am 05/01/2026', style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Text('Last post date: 12pm on 18/12/2025', style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 12),
                          Text('-------------------------'),
                          SizedBox(height: 12),
                          Text('(Term Time)', style: TextStyle(fontStyle: FontStyle.italic)),
                          SizedBox(height: 8),
                          Text('Monday - Friday 10am - 4pm', style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 12),
                          Text('(Outside of Term Time / Consolidation Weeks)'),
                          SizedBox(height: 8),
                          Text('Monday - Friday 10am - 3pm', style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 12),
                          Text('Purchase online 24/7', style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      );

                      Widget helpInfo = Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Help and Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 12),
                          TextButton(onPressed: placeholderCallbackForButtons, child: const Text('Search', style: TextStyle(color: Colors.black))),
                          TextButton(onPressed: placeholderCallbackForButtons, child: const Text('Terms & Conditions of Sale', style: TextStyle(color: Colors.black))),
                          TextButton(onPressed: placeholderCallbackForButtons, child: const Text('Policy', style: TextStyle(color: Colors.black))),
                        ],
                      );

                      Widget latestOffers = Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Latest Offers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 44,
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey.shade400),
                                  ),
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Email address', style: TextStyle(color: Colors.grey)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963), padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
                                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Subscribed'))),
                                child: const Text('SUBSCRIBE'),
                              ),
                            ],
                          ),
                        ],
                      );

                      if (isNarrow) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            openingHours,
                            const SizedBox(height: 24),
                            helpInfo,
                            const SizedBox(height: 24),
                            latestOffers,
                          ],
                        );
                      }

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: openingHours),
                          const SizedBox(width: 40),
                          Expanded(child: helpInfo),
                          const SizedBox(width: 40),
                          Expanded(child: latestOffers),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use a fixed aspect ratio for predictable sizing on mobile
          AspectRatio(
            aspectRatio: 4 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Builder(
                builder: (context) {
                  if (imageUrl.startsWith('assets/')) {
                    return Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.image_not_supported, color: Colors.grey),
                          ),
                        );
                      },
                    );
                  }

                  return Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.image_not_supported, color: Colors.grey),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
