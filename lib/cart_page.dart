import 'package:flutter/material.dart';

class Cart {
  // Each item: {'title': String, 'price': double, 'image': String, 'quantity': int}
  static final ValueNotifier<List<Map<String, dynamic>>> items =
      ValueNotifier([]);

  static double _parsePrice(dynamic price) {
    if (price is double) return price;
    if (price is int) return price.toDouble();
    if (price is String) {
      final cleaned = price.replaceAll(RegExp(r'[£,]'), '').trim();
      return double.tryParse(cleaned) ?? 0.0;
    }
    return 0.0;
  }

  static void addItem(
      {required String title, required dynamic price, String? image}) {
    final list = items.value;
    final idx = list.indexWhere((e) => e['title'] == title);
    if (idx >= 0) {
      list[idx]['quantity'] = (list[idx]['quantity'] as int) + 1;
    } else {
      list.add({
        'title': title,
        'price': _parsePrice(price),
        'image': image ?? '',
        'quantity': 1,
      });
    }
    // trigger update
    items.value = List<Map<String, dynamic>>.from(list);
  }

  static void removeAt(int index) {
    final list = items.value;
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      items.value = List<Map<String, dynamic>>.from(list);
    }
  }

  static void updateQuantity(int index, int qty) {
    final list = items.value;
    if (index >= 0 && index < list.length) {
      list[index]['quantity'] = qty;
      items.value = List<Map<String, dynamic>>.from(list);
    }
  }

  static void clear() {
    items.value = [];
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  double _subtotal(List<Map<String, dynamic>> items) {
    var sum = 0.0;
    for (final it in items) {
      final price = it['price'] as double? ?? 0.0;
      final qty = it['quantity'] as int? ?? 1;
      sum += price * qty;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ValueListenableBuilder<List<Map<String, dynamic>>>(
          valueListenable: Cart.items,
          builder: (context, items, _) {
            if (items.isEmpty) {
              return const Center(child: Text('Your basket is empty'));
            }

            final subtotal = _subtotal(items);

            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, i) {
                      final it = items[i];
                      return ListTile(
                        leading: it['image'] != null && it['image']!.isNotEmpty
                            ? (it['image']!.startsWith('assets/')
                                ? Image.asset(it['image']!,
                                    width: 56, height: 56, fit: BoxFit.cover)
                                : Image.network(it['image']!,
                                    width: 56,
                                    height: 56,
                                    fit: BoxFit.cover,
                                    errorBuilder: (c, e, s) => Container(
                                        width: 56,
                                        height: 56,
                                        color: Colors.grey[200])))
                            : Container(
                                width: 56, height: 56, color: Colors.grey[200]),
                        title: Text(it['title'] ?? ''),
                        subtitle: Text(
                            '£${(it['price'] as double).toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: (it['quantity'] as int) > 1
                                  ? () => Cart.updateQuantity(
                                      i, (it['quantity'] as int) - 1)
                                  : () => Cart.removeAt(i),
                            ),
                            Text('${it['quantity'] ?? 1}'),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () => Cart.updateQuantity(
                                  i, (it['quantity'] as int) + 1),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('£${subtotal.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963)),
                        onPressed: () {
                          // demo checkout: place order and clear cart
                          final count = items.fold<int>(
                              0, (acc, it) => acc + (it['quantity'] as int));
                          Cart.clear();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Order placed for $count items')));
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (r) => false);
                        },
                        child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Text('PLACE ORDER')),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Cart.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Basket cleared')));
                        },
                        child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Text('CLEAR')),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
