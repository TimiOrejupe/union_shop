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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),

                        const Text(
                          'Welcome to the Union Shop!',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),

                        const SizedBox(height: 20),

                        const Text.rich(
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

                        const SizedBox(height: 20),

                        const Text(
                          'All online purchases are available for delivery or instore collection!',
                          style: TextStyle(fontSize: 16, height: 1.9, color: Colors.grey),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at ",
                          style: TextStyle(fontSize: 16, height: 1.9, color: Colors.grey),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          'hello@upsu.net',
                          style: TextStyle(fontSize: 16, height: 1.9, color: Colors.grey, decoration: TextDecoration.underline),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Happy shopping!',
                          style: TextStyle(fontSize: 16, height: 1.9, color: Colors.grey),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'The Union Shop & Reception Team',
                          style: TextStyle(fontSize: 16, height: 1.9, color: Colors.grey),
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),

              // Footer section
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Divider(),
                    const SizedBox(height: 12),
                    const SizedBox(height: 40),
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