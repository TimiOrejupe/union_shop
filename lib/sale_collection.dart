import 'package:flutter/material.dart';

class SaleCollectionPage extends StatelessWidget {
  const SaleCollectionPage({super.key});

  static const _products = [
    {
      'title': 'Classic Sweatshirt',
      'image': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      'price': '£35.00',
      'sale': '£28.00',
      'badge': '20% OFF'
    },
    {
      'title': 'Campus Hoodie',
      'image': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
      'price': '£45.00',
      'sale': '£33.75',
      'badge': '25% OFF'
    },
    {
      'title': 'Branded T‑Shirt',
      'image': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      'price': '£20.00',
      'sale': '£14.00',
      'badge': '30% OFF'
    },
    {
      'title': 'Autumn Cap',
      'image': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
      'price': '£12.00',
      'sale': '£9.60',
      'badge': '20% OFF'
    },
  ];
 void _navigateHome(BuildContext context) => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);

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
