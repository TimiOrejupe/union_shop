import 'package:flutter/material.dart';
import 'package:union_shop/shop_menu.dart';
import 'package:union_shop/cart_page.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          color: Colors.transparent,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 720;
              final navPadding = isNarrow
                  ? const EdgeInsets.symmetric(horizontal: 12, vertical: 6)
                  : const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
               // use transparent background on narrow screens so hero isn't blocked
               // make the nav container transparent so it never blocks the hero
               // restore white background for the nav so the header appears as before
               return Container(
                 color: isNarrow ? Colors.transparent : Colors.white,
                 padding: navPadding,
                 child: Builder(builder: (context) {
                  Widget cartButton() {
                    return ValueListenableBuilder<List<Map<String, dynamic>>>(
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
                    );
                  }

                  if (isNarrow) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
                          child: Image.network(
                            'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                            height: 36,
                            errorBuilder: (context, error, stackTrace) => Container(width: 48, height: 48, color: Colors.grey[200]),
                          ),
                        ),
                        const Spacer(),
                        // compact menu
                        PopupMenuButton<int>(
                          icon: const Icon(Icons.menu, color: Colors.black),
                          onSelected: (v) {
                            switch (v) {
                              case 0:
                                Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
                                break;
                              case 1:
                                Navigator.pushNamed(context, '/collections');
                                break;
                              case 2:
                                Navigator.pushNamed(context, '/print-shack/text');
                                break;
                              case 3:
                                Navigator.pushNamed(context, '/print-shack/about');
                                break;
                              case 4:
                                Navigator.pushNamed(context, '/collections/sale-items');
                                break;
                              case 5:
                                Navigator.pushNamed(context, '/about');
                                break;
                            }
                          },
                          itemBuilder: (_) => const [
                            PopupMenuItem(value: 0, child: Text('Home')),
                            PopupMenuItem(value: 1, child: Text('Collections')),
                            PopupMenuItem(value: 2, child: Text('Personalisation')),
                            PopupMenuItem(value: 3, child: Text('Print Shack — About')),
                            PopupMenuItem(value: 4, child: Text('SALE')),
                            PopupMenuItem(value: 5, child: Text('About site')),
                          ],
                        ),
                        const SizedBox(width: 8),
                        cartButton(),
                      ],
                    );
                  }

                  // Wide layout
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
                        child: Image.network(
                          'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                          height: 36,
                          errorBuilder: (context, error, stackTrace) => Container(width: 48, height: 48, color: Colors.grey[200]),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Make nav links horizontally scrollable to avoid overflow on small widths
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
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
                        ),
                      ),
                      const SizedBox(width: 12),
                      cartButton(),
                    ],
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}
