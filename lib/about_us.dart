import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    void goHome() => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top sale banner
              Container(
                color: const Color(0xFF4d2963),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: const Text(
                  'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              // Header with logo and nav links
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: goHome,
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

                    // simple center nav row to mimic the site header
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(onPressed: goHome, child: const Text('Home', style: TextStyle(color: Colors.black))),
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
              // Page title
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: const Center(
                  child: Text(
                    'About us',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      height: 1.1,
                    ),
                  ),
                ),
              ),
                        // Main content - centered narrow column to match site
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),

                        Text(
                          'Welcome to the Union Shop!',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),

                        SizedBox(height: 20),

                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'We’re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive ',
                              ),
                              TextSpan(
                                text: 'personalisation service',
                                style: TextStyle(decoration: TextDecoration.underline),
                              ),
                              TextSpan(text: '!'),
                            ],
                          ),
                          style: TextStyle(fontSize: 16, height: 1.9, color: Colors.grey),
                        ),

                        SizedBox(height: 20),

                        Text(
                          'All online purchases are available for delivery or instore collection!',
                          style: TextStyle(fontSize: 16, height: 1.9, color: Colors.grey),
                        ),

                        SizedBox(height: 20),

                        Text(
                          "We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at ",
                          style: TextStyle(fontSize: 16, height: 1.9, color: Colors.grey),
                        ),

                        SizedBox(height: 6),

                        Text(
                          'hello@upsu.net',
                          style: TextStyle(fontSize: 16, height: 1.9, color: Colors.grey, decoration: TextDecoration.underline),
                        ),

                        SizedBox(height: 20),

                        Text(
                          'Happy shopping!',
                          style: TextStyle(fontSize: 16, height: 1.9, color: Colors.grey),
                        ),

                        SizedBox(height: 20),

                        Text(
                          'The Union Shop & Reception Team',
                          style: TextStyle(fontSize: 16, height: 1.9, color: Colors.grey),
                        ),

                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),

              // Footer section
              Container(
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
                              onPressed: () {},
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