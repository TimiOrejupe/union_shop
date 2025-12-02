import 'package:flutter/material.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  static const _collections = [
    {
      'title': 'Autumn Favourites',
      'image':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
    },
    {
      'title': 'Black Friday',
      'image':
          'https://shop.upsu.net/cdn/shop/files/BlackFridayPlaceholder.jpg',
    },
    {
      'title': 'Clothing',
      'image':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
    },
    {
      'title': 'Hoodies',
      'image':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
    },
    {
      'title': 'Accessories',
      'image':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
    },
    {
      'title': 'T-Shirts',
      'image':
          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
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
              // Top purple banner
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

              // Header row (logo + centered nav)
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
                        errorBuilder: (c, e, s) => Container(
                          width: 48,
                          height: 48,
                          color: Colors.grey[200],
                          child: const Icon(Icons.image_not_supported, color: Colors.grey),
                        ),
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

              const SizedBox(height: 48),

              // Title
              const Center(
                child: Text(
                  'Collections',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: Colors.black87),
                ),
              ),

              const SizedBox(height: 32),

              // Grid
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
                    children: _collections.map((c) {
                      return CollectionTile(title: c['title']!, imageUrl: c['image']!);
                    }).toList(),
                  ),
                ),
              ),

              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CollectionTile({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) => Container(color: Colors.grey[200]),
              ),
            ),
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.35)),
            ),
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
