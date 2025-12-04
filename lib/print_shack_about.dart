import 'package:flutter/material.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Print Shack'), backgroundColor: const Color(0xFF4d2963)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Print Shack', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
            SizedBox(height: 12),
            Text('We personalise garments and merchandise with high-quality screen printing and heat transfer methods.'),
            SizedBox(height: 8),
            Text('Submit your text, choose placement, font and colour. We handle the rest.'),
          ],
        ),
      ),
    );
  }
}