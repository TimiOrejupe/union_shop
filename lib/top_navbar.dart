import 'package:flutter/material.dart';
import 'package:union_shop/shop_menu.dart';
import 'package:union_shop/cart_page.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
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
                    errorBuilder: (context, error, stackTrace) => Container(width: 48, height: 48, color: Colors.grey[200]),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false), child: const Text('Home', style: TextStyle(color: Colors.black))),
                    const SizedBox(width: 8),
                    const ShopMenu(),
                    const SizedBox(width: 8),
                    PopupMenuButton<int>(
                      tooltip: 'The Print Shack',
                      onSelected: (v) {
                        if (v == 0) Navigator.pushNamed(context, '/print-shack/about');
                        if (v == 1) Navigator.pushNamed(context, '/print-shack/text');
                      },
                      itemBuilder: (_) => const [
                        PopupMenuItem<int>(value: 0, child: Text('About')),
                        PopupMenuItem<int>(value: 1, child: Text('Personalisation')),
                      ],
                      child: const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0), child: Text('The Print Shack', style: TextStyle(color: Colors.black))),
                    ),
                    const SizedBox(width: 8),
                    TextButton(onPressed: () => Navigator.pushNamed(context, '/collections/sale-items'), child: const Text('SALE!', style: TextStyle(color: Colors.black))),
                    const SizedBox(width: 8),
                    TextButton(onPressed: () => Navigator.pushNamed(context, '/about'), child: const Text('About', style: TextStyle(color: Colors.black))),
                    const SizedBox(width: 8),
                    TextButton(onPressed: () => Navigator.pushNamed(context, '/collections'), child: const Text('Collections', style: TextStyle(color: Colors.black))),
                    const SizedBox(width: 8),
                  ],
                ),
                const Spacer(),
                // Cart icon with live count
                ValueListenableBuilder<List<Map<String, dynamic>>>(
                  valueListenable: Cart.items,
                  builder: (context, items, _) {
                    final count = items.fold<int>(0, (acc, it) => acc + (it['quantity'] as int));
                    return IconButton(
                      tooltip: 'View basket',
                      onPressed: () => Navigator.pushNamed(context, '/cart'),
                      icon: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(Icons.shopping_bag_outlined, color: Colors.black),
                          if (count > 0)
                            Positioned(
                              right: -6,
                              top: -6,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                                child: Text('$count', style: const TextStyle(color: Colors.white, fontSize: 10)),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
