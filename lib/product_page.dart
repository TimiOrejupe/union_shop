import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> images = [
    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
  ];

  int selectedImage = 0;
  String selectedSize = 'M';
  String selectedColor = 'Heather';
  int quantity = 1;

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to cart (demo)')),
    );
  }

  void _buyNow() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Proceed to checkout (demo)')),
    );
  }
@override
  Widget build(BuildContext context) {
    final productTitle = 'Classic Sweatshirt';
    final productPrice = '£28.00';
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
                      Text(productTitle, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
                      const SizedBox(height: 8),
                      Text(productPrice, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF4d2963))),
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
                                  items: ['Heather', 'Charcoal', 'Navy'].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
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
                        'A warm, durable classic sweatshirt with a soft brushed interior. Printed with University branding. Machine washable.',
                        style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
                      ),

                      const SizedBox(height: 20),

                      const Text('Product details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      const Text('- 80% cotton / 20% polyester\n- Brushed inner fleece\n- Designed for everyday wear\n- Ethically sourced materials', style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5)),

                      const SizedBox(height: 28),

                      // Reviews placeholder
                      const Text('Reviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(6)),
                        child: const Text('No reviews yet. This is a demo product page.'),
                      ),

                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),



