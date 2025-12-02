import 'package:flutter/material.dart';

class AutumnCollectionPage extends StatelessWidget {
  const AutumnCollectionPage({super.key});

  static const _products = [
    {'title': 'Autumn Hoodie', 'price': '£35.00', 'image': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'},
    {'title': 'Autumn T‑Shirt', 'price': '£18.00', 'image': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561'},
    {'title': 'Autumn Cap', 'price': '£12.00', 'image': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'},
    {'title': 'Autumn Scarf', 'price': '£10.00', 'image': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561'},
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
              // Top purple banner + header (matches other pages)
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
                      onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
                      child: Image.network(
                        'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                        height: 48,
                        errorBuilder: (c, e, s) => Container(width: 48, height: 48, color: Colors.grey[200]),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false), child: const Text('Home', style: TextStyle(color: Colors.black))),
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

              const SizedBox(height: 40),

              // Page title / breadcrumb
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Autumn Favourites',
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
                      return _ProductTile(title: p['title']!, price: p['price']!, imageUrl: p['image']!);
                    }).toList(),
                  ),
                ),
              ),

              const SizedBox(height: 48),

              // Footer (simple copy of site footer used elsewhere)
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

class _ProductTile extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const _ProductTile({required this.title, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(imageUrl, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(color: Colors.grey[200])),
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
                  Text(price, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}