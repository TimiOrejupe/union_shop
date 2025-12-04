import 'package:flutter/material.dart';
import 'package:union_shop/top_navbar.dart';
import 'package:union_shop/cart_page.dart';

class EssentialCollectionPage extends StatelessWidget {
  const EssentialCollectionPage({super.key});

  static const _products = [
    {
      'title': 'Essential Hoodie',
      'price': '£15.00',
      'image': 'assets/images/university_hoodie.png'
    },
    {
      'title': 'Essential T‑Shirt',
      'price': '£10.00',
      'image': 'assets/images/university_t-shirt2.jpg'
    },
    {
      'title': 'Essential Joggers',
      'price': '£12.00',
      'image': 'assets/images/university_joggers.png'
    },
    {
      'title': 'Essential Sweatshirt',
      'price': '£15.00',
      'image': 'assets/images/hoodies_sweatshirts.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 1000 ? 3 : (width > 600 ? 2 : 1);

    void goBackToCollections() => Navigator.pushNamedAndRemoveUntil(context, '/collections', (r) => false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top purple banner
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

              // Header row
              const TopNavBar(),

              const SizedBox(height: 40),

              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'ESSENTIAL RANGE',
                          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: Colors.grey[900]),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: goBackToCollections,
                          child: const Text('← Back to Collections', style: TextStyle(color: Colors.black54)),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),

              // Products grid
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
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 4 / 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                p['image']!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (c, e, s) => Container(color: Colors.grey[200]),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(p['title']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 4),
                          Text(p['price']!, style: const TextStyle(color: Colors.grey)),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              // lazy add to cart
                              Cart.addItem(title: p['title']!, price: p['price']!, image: p['image']!);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${p['title']} added to basket')));
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963)),
                            child: const Text('ADD TO BASKET'),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),

              const SizedBox(height: 48),

              // Footer
              const _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
