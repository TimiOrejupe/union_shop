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
Widget _loginForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          const Text('Welcome back', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          const Text('Sign in to your account', style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 18),
          const TextField(decoration: InputDecoration(labelText: 'Email address', border: OutlineInputBorder())),
          const SizedBox(height: 12),
          const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder())),
          const SizedBox(height: 12),
          Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () => _notImplemented(context), child: const Text('Forgot password?'))),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: () => _notImplemented(context), child: const Padding(padding: EdgeInsets.symmetric(vertical: 14), child: Text('Sign in'))),
          const SizedBox(height: 12),
          const Row(children: [
            Expanded(child: Divider()),
            Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('OR', style: TextStyle(color: Colors.black54))),
            Expanded(child: Divider()),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            _socialButton(context, 'Continue with Google', Icons.g_mobiledata),
            const SizedBox(width: 12),
            _socialButton(context, 'Continue with Apple', Icons.apple),
          ]),
        ],
      ),
    );
  }
Widget _signupForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          const Text('Create account', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          const Text('Sign up to place orders, save addresses and more', style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 18),
          const TextField(decoration: InputDecoration(labelText: 'Full name', border: OutlineInputBorder())),
          const SizedBox(height: 12),
          const TextField(decoration: InputDecoration(labelText: 'Email address', border: OutlineInputBorder())),
          const SizedBox(height: 12),
          const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder())),
          const SizedBox(height: 12),
          const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Confirm password', border: OutlineInputBorder())),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () => _notImplemented(context), child: const Padding(padding: EdgeInsets.symmetric(vertical: 14), child: Text('Create account'))),
          const SizedBox(height: 12),
          const Row(children: [
            Expanded(child: Divider()),
            Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('OR', style: TextStyle(color: Colors.black54))),
            Expanded(child: Divider()),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            _socialButton(context, 'Continue with Google', Icons.g_mobiledata),
            const SizedBox(width: 12),
            _socialButton(context, 'Continue with Apple', Icons.apple),
          ]),
        ],
      ),
    );
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _header(context),
            const SizedBox(height: 28),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const Material(
                      color: Colors.white,
                      child: TabBar(
                        labelColor: Colors.black87,
                        unselectedLabelColor: Colors.black54,
                        indicatorColor: Color(0xFF4d2963),
                        tabs: [Tab(text: 'Login'), Tab(text: 'Sign up')],
                      ),
                    ),
                    SizedBox(
                      height: 520,
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(child: _loginForm(context)),
                          SingleChildScrollView(child: _signupForm(context)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
const Spacer(),
            // small footer note
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text('By continuing you agree to the Terms & Conditions', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}