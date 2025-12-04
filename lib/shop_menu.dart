import 'package:flutter/material.dart';

class ShopMenu extends StatelessWidget {
  const ShopMenu({super.key});

  static const _items = <String>[
    'Clothing',
    'Merchandise',
    'Halloween 🎃',
    'Signature & Essential Range',
    'Portsmouth City Collection',
    'Pride Collection 🏳️‍🌈',
    'Graduation 🎓',
  ];
   void _openMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (c) {
        return SafeArea(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: _items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (ctx, i) {
              return ListTile(
                title: Text(_items[i]),
                onTap: () {
                  Navigator.pop(ctx);
                  // placeholder: replace with real navigation if needed
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 800;

      if (isMobile) {
        // collapsed mobile button
        return TextButton.icon(
          onPressed: () => _openMobileMenu(context),
          icon: const Icon(Icons.menu, size: 18),
          label: const Text('Shop'),
        );
      }

      // desktop dropdown
      return PopupMenuButton<int>(
        tooltip: 'Shop',
        offset: const Offset(0, 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        itemBuilder: (ctx) {
          return List.generate(_items.length, (i) {
            return PopupMenuItem<int>(
              value: i,
              child: Text(_items[i]),
            );
          });
        },
        onSelected: (index) {
          // placeholder: add navigation if required
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Shop', style: TextStyle(color: Colors.black)),
        ),
      );
    });
  }
}