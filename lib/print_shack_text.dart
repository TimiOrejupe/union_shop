import 'package:flutter/material.dart';
import 'package:union_shop/cart_page.dart';

class PrintShackTextPage extends StatefulWidget {
  const PrintShackTextPage({super.key});

  @override
  State<PrintShackTextPage> createState() => _PrintShackTextPageState();
}

class _PrintShackTextPageState extends State<PrintShackTextPage> {
  final _textController = TextEditingController();

  String _product = 'T‑Shirt';
  String _placement = 'Chest';
  String _font = 'Sans';
  String _color = 'Black';
  int _maxChars = 30;

  final _fonts = ['Sans', 'Serif', 'Script', 'Monospace'];
  final _colors = ['Black', 'White', 'Gold', 'Silver'];

  Map<String, List<String>> productPlacements = {
    'T‑Shirt': ['Chest', 'Back'],
    'Hoodie': ['Chest', 'Back', 'Sleeve'],
    'Mug': ['Wrap', 'One side'],
  };

  Map<String, int> productCharLimit = {
    'T‑Shirt': 30,
    'Hoodie': 35,
    'Mug': 20,
  };

  @override
  void initState() {
    super.initState();
    _updateProductDependentFields();
  }

  void _updateProductDependentFields() {
    final placements = productPlacements[_product]!;
    if (!placements.contains(_placement)) {
      _placement = placements.first;
    }
    _maxChars = productCharLimit[_product] ?? 30;
    if (_textController.text.length > _maxChars) {
      _textController.text = _textController.text.substring(0, _maxChars);
    }
    setState(() {});
  }

  void _addToCart() {
    final title = 'Personalised $_product';
    const price = '£12.00'; // demo fixed price
    final previewText = _textController.text.trim();
    const image = ''; // leave empty for demo
    Cart.addItem(title: title + (previewText.isNotEmpty ? ' - $previewText' : ''), price: price, image: image);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title added to basket')));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final placements = productPlacements[_product]!;

    return Scaffold(
      appBar: AppBar(title: const Text('Print Shack — Personalise Text'), backgroundColor: const Color(0xFF4d2963)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Personalise text for your item', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),

            // Product selector
            Row(
              children: [
                const Text('Product:', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(width: 12),
                DropdownButton<String>(
                  value: _product,
                  items: productPlacements.keys.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    _product = v;
                    _updateProductDependentFields();
                  },
                ),
                const SizedBox(width: 24),
                const Text('Placement:', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(width: 12),
                DropdownButton<String>(
                  value: _placement,
                  items: placements.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _placement = v);
                  },
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Font and color
            Row(
              children: [
                const Text('Font:', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(width: 12),
                DropdownButton<String>(
                  value: _font,
                  items: _fonts.map((f) => DropdownMenuItem(value: f, child: Text(f))).toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _font = v);
                  },
                ),
                const SizedBox(width: 24),
                const Text('Color:', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(width: 12),
                DropdownButton<String>(
                  value: _color,
                  items: _colors.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _color = v);
                  },
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Text input with dynamic max length
            TextField(
              controller: _textController,
              maxLength: _maxChars,
              decoration: InputDecoration(labelText: 'Text to print (max $_maxChars chars)', border: const OutlineInputBorder()),
              onChanged: (v) => setState(() {}),
            ),

            const SizedBox(height: 20),

            // Live preview
            const Text('Preview', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
              child: Text(
                _textController.text.isEmpty ? 'Your text will appear here' : _textController.text,
                style: TextStyle(
                  fontSize: 18,
                  color: _color == 'Black' ? Colors.black : (_color == 'White' ? Colors.white : Colors.black87),
                  fontFamily: _font == 'Serif' ? 'serif' : (_font == 'Monospace' ? 'monospace' : null),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                ElevatedButton(
                  onPressed: _addToCart,
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963)),
                  child: const Padding(padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), child: Text('Add to basket')),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () => Navigator.pushNamed(context, '/print-shack/about'),
                  child: const Padding(padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), child: Text('About Print Shack')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}