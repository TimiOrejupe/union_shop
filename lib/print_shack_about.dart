import 'package:flutter/material.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Personalisation'),
          backgroundColor: const Color(0xFF4d2963)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('The Print Shack — Personalisation',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              const Text(
                'We offer high-quality text personalisation for garments and merchandise. Choose a product, enter the text you want printed, select placement, font and colour — we will reproduce that text using industry-standard print methods to give a durable finish.',
                style: TextStyle(fontSize: 16, height: 1.4),
              ),

              const SizedBox(height: 20),

              const Text('Pricing & turnaround',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text(
                  '• Prices start from £5 for small text prints; personalised products in the Personalisation tool show a demo price.',
                  style: TextStyle(height: 1.4)),
              const Text(
                  '• Typical turnaround: 3-7 working days depending on stock and order size.',
                  style: TextStyle(height: 1.4)),

              const SizedBox(height: 20),

              const Text('Artwork & text guidelines',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text(
                  '• For text personalisation: keep messages under the character limits shown in the form for each product.',
                  style: TextStyle(height: 1.4)),
              const Text(
                  '• For logos or images: we recommend uploading vector artwork (SVG, EPS) or high-resolution PNG with transparent background.',
                  style: TextStyle(height: 1.4)),
              const Text(
                  '• Avoid very small text sizes and extremely thin fonts for printed transfers as they may not reproduce well.',
                  style: TextStyle(height: 1.4)),

              const SizedBox(height: 20),

              const Text('How to order',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text('1) Open the Personalisation page from the menu.',
                  style: TextStyle(height: 1.4)),
              const Text(
                  '2) Select product, placement, font and colour, then enter your text.',
                  style: TextStyle(height: 1.4)),
              const Text(
                  '3) Add the personalised item to your basket and complete the order at checkout.',
                  style: TextStyle(height: 1.4)),

              const SizedBox(height: 20),

              const Text('Contact & support',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text(
                  'If you need help with artwork or bespoke requests, email: printshack@example.com',
                  style: TextStyle(height: 1.4)),

              const SizedBox(height: 28),

              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963)),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/print-shack/text'),
                    child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        child: Text('Go to Personalisation')),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context, '/', (r) => false),
                    child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        child: Text('Back to Home')),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // small footer note
              const Text(
                  'Note: This is a demo implementation. Orders placed here are for demonstration only.',
                  style: TextStyle(color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}
