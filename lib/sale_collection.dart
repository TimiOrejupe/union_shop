import 'package:flutter/material.dart';
import 'package:union_shop/top_navbar.dart';
import 'package:union_shop/cart_page.dart';

class SaleCollectionPage extends StatelessWidget {
  const SaleCollectionPage({super.key});

  static const _products = [
    {
      'title': 'Classic Sweatshirt',
      'image': 'assets/images/hoodies_sweatshirts.jpg',
      'price': '£35.00',
      'sale': '£28.00',
      'badge': '20% OFF'
    },
    {
      'title': 'Campus Hoodie',
      'image': 'assets/images/university_hoodie.png',
      'price': '£45.00',
      'sale': '£33.75',
      'badge': '25% OFF'
    },
    {
      'title': 'Branded T‑Shirt',
      'image': 'assets/images/university_t-shirt.png',
      'price': '£20.00',
      'sale': '£14.00',
      'badge': '30% OFF'
    },
    {
      'title': 'Joggers',
      'image': 'assets/images/university_joggers.png',
      'price': '£12.00',
      'sale': '£9.60',
      'badge': '20% OFF'
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 1000 ? 3 : (width > 600 ? 2 : 1);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Purple sale banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                color: const Color(0xFF4d2963),
                child: const Text(
                  'SALE! Selected lines reduced — limited stock. Shop now.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              const TopNavBar(),

              const SizedBox(height: 40),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: const Column(
                    children: [
                      Text('Sale Items', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: Colors.black87)),
                      SizedBox(height: 12),
                      Text('Discounted prices across our favourite ranges. Limited sizes and stock — shop early!', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black54)),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: GridView.count(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: _products.map((p) {
                      return SaleProductTile(
                        title: p['title']!,
                        imageUrl: p['image']!,
                        price: p['price']!,
                        salePrice: p['sale']!,
                        badge: p['badge']!,
                      );
                    }).toList(),
                  ),
                ),
              ),
const SizedBox(height: 48),

              // Footer (same style used elsewhere)
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

class SaleProductTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String price;
  final String salePrice;
  final String badge;

  const SaleProductTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.salePrice,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Cart.addItem(title: title, price: salePrice, image: imageUrl);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title added to basket')));
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Stack(
            children: [
              Positioned.fill(
                child: imageUrl.startsWith('http')
                    ? Image.network(imageUrl, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(color: Colors.grey[200]))
                    : Image.asset(imageUrl, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(color: Colors.grey[200])),
              ),
              Positioned(
                left: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  color: const Color(0xFF4d2963),
                  child: Text(badge, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
                ),
              ),
              // ignore: deprecated_member_use
              Positioned.fill(child: Container(color: Colors.black.withOpacity(0.25))),
              Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(price, style: const TextStyle(color: Colors.white70, decoration: TextDecoration.lineThrough)),
                        const SizedBox(width: 8),
                        Text(salePrice, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
