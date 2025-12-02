import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> images = [
    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
  ];

  int selectedImage = 0;
  String selectedSize = 'M';
  String selectedColor = 'Heather';
  int quantity = 1;

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to cart (demo)')),
    );
  }

  void _buyNow() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Proceed to checkout (demo)')),
    );
  }

  