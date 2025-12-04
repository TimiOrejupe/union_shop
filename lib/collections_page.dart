import 'package:flutter/material.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  static const _collections = [
    {
      'title': 'ESSENTIAL RANGE',
      'image':
          'assets/images/university_shirt-man.png',
      'route': '/collections/essential-range'
    },
    {
      'title': 'Graduation',
      'image': 'assets/images/university_graduation.jpg',
    },
    {
      'title': 'Summer Vibes',
      'image':
          'assets/images/university_summer.jpg',
    },
    {
      'title': 'Hoodies',
      'image':
          'assets/images/university_hoodie.png',
    },
    {
      'title': 'stationery',
      'image':
          'assets/images/university_stationary.jpg',
    },
    {
      'title': 'T-Shirts',
      'image':
          'assets/images/university_t-shirt.png',
    },
  ];

  void _navigateHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
  }

  void _placeholder() {
    // placeholder for non-functional links
  }

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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                color: const Color(0xFF4d2963),
                child: const Text(
                  'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),

              // Header row (logo + centered nav)
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => _navigateHome(context),
                      child: Image.network(
                        'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                        height: 48,
                        errorBuilder: (c, e, s) => Container(
                          width: 48,
                          height: 48,
                          color: Colors.grey[200],
                          child: const Icon(Icons.image_not_supported,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                            onPressed: () => _navigateHome(context),
                            child: const Text('Home',
                                style: TextStyle(color: Colors.black))),
                        const SizedBox(width: 8),
                        TextButton(
                            onPressed: _placeholder,
                            child: const Text('Shop',
                                style: TextStyle(color: Colors.black))),
                        const SizedBox(width: 8),
                        TextButton(
                            onPressed: _placeholder,
                            child: const Text('The Print Shack',
                                style: TextStyle(color: Colors.black))),
                        const SizedBox(width: 8),
                        TextButton(
                            onPressed: _placeholder,
                            child:
                                const Text('SALE!', style: TextStyle(color: Colors.black))),
                        const SizedBox(width: 8),
                        TextButton(
                            onPressed: () => Navigator.pushNamed(context, '/about'),
                            child: const Text('About',
                                style: TextStyle(color: Colors.black))),
                        const SizedBox(width: 8),
                        TextButton(
                            onPressed: _placeholder,
                            child: const Text('UPSU.net',
                                style: TextStyle(color: Colors.black))),
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
                  style: TextStyle(
                      fontSize: 34, fontWeight: FontWeight.w700, color: Colors.black87),
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
                      return CollectionTile(
                        title: c['title']!,
                        imageUrl: c['image']!,
                        route: c['route'],
                      );
                    }).toList(),
                  ),
                ),
              ),

              const SizedBox(height: 48),

              // Footer (same as about_us.dart)
              Container(
                width: double.infinity,
                color: Colors.grey[50],
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isNarrow = constraints.maxWidth < 800;

                    Widget openingHours = const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Opening Hours',
                            style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                        SizedBox(height: 12),
                        Text('❄️ Winter Break Closure Dates ❄️',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 8),
                        Text('Closing 4pm 19/12/2025',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 8),
                        Text('Reopening 10am 05/01/2026',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 8),
                        Text('Last post date: 12pm on 18/12/2025',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 12),
                        Text('-------------------------'),
                        SizedBox(height: 12),
                        Text('(Term Time)', style: TextStyle(fontStyle: FontStyle.italic)),
                        SizedBox(height: 8),
                        Text('Monday - Friday 10am - 4pm',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 12),
                        Text('(Outside of Term Time / Consolidation Weeks)'),
                        SizedBox(height: 8),
                        Text('Monday - Friday 10am - 3pm',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 12),
                        Text('Purchase online 24/7',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    );

                    Widget helpInfo = Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Help and Information',
                            style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 12),
                        TextButton(onPressed: _placeholder, child: const Text('Search', style: TextStyle(color: Colors.black))),
                        TextButton(onPressed: _placeholder, child: const Text('Terms & Conditions of Sale', style: TextStyle(color: Colors.black))),
                        TextButton(onPressed: _placeholder, child: const Text('Policy', style: TextStyle(color: Colors.black))),
                      ],
                    );

                    Widget latestOffers = Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Latest Offers',
                            style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
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

class CollectionTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? route;

  const CollectionTile({super.key, required this.title, required this.imageUrl, this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          Navigator.pushNamed(context, route!);
        }
      },
      child: AspectRatio(
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
              // ignore: deprecated_member_use
              Positioned.fill(child: Container(color: Colors.black.withOpacity(0.35))),
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
      ),
    );
  }
}
