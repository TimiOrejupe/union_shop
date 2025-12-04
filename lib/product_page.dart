import 'package:flutter/material.dart';
import 'package:union_shop/cart_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> images = [
    'assets/images/university_t-shirt.png',
    'assets/images/university_shirt-man.png',
    'assets/images/university_t-shirt2.jpg',
  ];

  int selectedImage = 0;
  String selectedSize = 'M';
  String selectedColor = 'Purple';
  int quantity = 1;

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void _addToCart() {
    const title = 'University T-shirt';
    const price = '£10.00';
    final image = images[selectedImage];
    Cart.addItem(title: title, price: price, image: image);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('$title added to basket')));
  }

  void _buyNow() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Proceed to checkout')),
    );
  }

  @override
  Widget build(BuildContext context) {
    const productTitle = 'University T-shirt';
    const productPrice = '£10.00';
    final width = MediaQuery.of(context).size.width;
    final imageHeight = width > 1000 ? 480.0 : 300.0;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top banner + header (matches other pages)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: const Color(0xFF4d2963),
                child: const Text(
                  'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
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
                        errorBuilder: (c, e, s) =>
                            Container(width: 48, height: 48, color: Colors.grey[200]),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(onPressed: () => navigateToHome(context), child: const Text('Home', style: TextStyle(color: Colors.black))),
                        const SizedBox(width: 8),
                        TextButton(onPressed: () {}, child: const Text('Shop', style: TextStyle(color: Colors.black))),
                        const SizedBox(width: 8),
                        TextButton(onPressed: () {}, child: const Text('The Print Shack', style: TextStyle(color: Colors.black))),
                        const SizedBox(width: 8),
                        TextButton(onPressed: () {}, child: const Text('SALE!', style: TextStyle(color: Colors.black))),
                        const SizedBox(width: 8),
                        TextButton(onPressed: () => Navigator.pushNamed(context, '/about'), child: const Text('About', style: TextStyle(color: Colors.black))),
                        const SizedBox(width: 8),
                        TextButton(onPressed: () {}, child: const Text('UPSU.net', style: TextStyle(color: Colors.black))),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Product content area constrained
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product title / price row
                      const Text(productTitle, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
                      const SizedBox(height: 8),
                      const Text(productPrice, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF4d2963))),
                      const SizedBox(height: 20),

                      // Images: large image + thumbnails
                      SizedBox(
                        height: imageHeight,
                        child: Stack(
                          children: [
                            PageView.builder(
                              itemCount: images.length,
                              onPageChanged: (i) => setState(() => selectedImage = i),
                              controller: PageController(initialPage: selectedImage),
                              itemBuilder: (context, index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    images[index],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (c, e, s) => Container(color: Colors.grey[200]),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),
                      SizedBox(
                        height: 72,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (context, i) {
                            final isSelected = i == selectedImage;
                            return GestureDetector(
                              onTap: () => setState(() => selectedImage = i),
                              child: Opacity(
                                opacity: isSelected ? 1 : 0.6,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    images[i],
                                    width: 72,
                                    height: 72,
                                    fit: BoxFit.cover,
                                    errorBuilder: (c, e, s) => Container(color: Colors.grey[200]),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Options row: Size, Color, Quantity
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Size dropdown
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Size', style: TextStyle(fontWeight: FontWeight.w600)),
                                const SizedBox(height: 6),
                                DropdownButton<String>(
                                  value: selectedSize,
                                  isExpanded: true,
                                  items: ['S', 'M', 'L', 'XL'].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                                  onChanged: (v) => setState(() { if (v != null) selectedSize = v; }),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Color dropdown
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Colour', style: TextStyle(fontWeight: FontWeight.w600)),
                                const SizedBox(height: 6),
                                DropdownButton<String>(
                                  value: selectedColor,
                                  isExpanded: true,
                                  items: ['Purple', 'White', 'Navy'].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                                  onChanged: (v) => setState(() { if (v != null) selectedColor = v; }),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Quantity selector
                          SizedBox(
                            width: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Quantity', style: TextStyle(fontWeight: FontWeight.w600)),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: quantity > 1 ? () => setState(() => quantity--) : null,
                                    ),
                                    Text('$quantity', style: const TextStyle(fontSize: 16)),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () => setState(() => quantity++),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // Action buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _addToCart,
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963), padding: const EdgeInsets.symmetric(vertical: 14)),
                              child: const Text('ADD TO BASKET', style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: _buyNow,
                              style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                              child: const Text('BUY NOW', style: TextStyle(fontSize: 16, color: Colors.black)),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      // Description / details
                      const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      const Text(
                        'A classic T-shirt. Printed with University branding. Machine washable.',
                        style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
                      ),

                      const SizedBox(height: 20),

                      const Text('Product details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      const Text('- 100% cotton \n- Designed for everyday wear\n- Ethically sourced materials', style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5)),

                      const SizedBox(height: 28),

                      // Reviews placeholder
                      const Text('Reviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(6)),
                        child: const Text('No reviews yet.'),
                      ),

                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
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
                        TextButton(onPressed: () {}, child: const Text('Search', style: TextStyle(color: Colors.black))),
                        TextButton(onPressed: () {}, child: const Text('Terms & Conditions of Sale', style: TextStyle(color: Colors.black))),
                        TextButton(onPressed: () {}, child: const Text('Policy', style: TextStyle(color: Colors.black))),
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
    );
  }
}



