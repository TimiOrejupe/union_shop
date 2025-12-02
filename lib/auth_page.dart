import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  void _notImplemented(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Not implemented (demo)')));
  }
 Widget _header(BuildContext context) {
    return Column(
      children: [
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
                  TextButton(onPressed: () => Navigator.pushNamed(context, '/'), child: const Text('Home', style: TextStyle(color: Colors.black))),
                  const SizedBox(width: 8),
                  TextButton(onPressed: () {}, child: const Text('Shop', style: TextStyle(color: Colors.black))),
                  const SizedBox(width: 8),
                  TextButton(onPressed: () => Navigator.pushNamed(context, '/about'), child: const Text('About', style: TextStyle(color: Colors.black))),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _socialButton(BuildContext c, String label, IconData icon) {
    return Expanded(
      child: OutlinedButton.icon(
        icon: Icon(icon, size: 18),
        label: Text(label),
        onPressed: () => _notImplemented(c),
      ),
    );
  }
