import 'package:flutter/material.dart';

Widget wrapWithMaterial(Widget child) {
  return MaterialApp(
    home: MediaQuery(
      data: const MediaQueryData(size: Size(2000, 4000)),
      child: SizedBox(
        width: 2000,
        height: 4000,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 4000),
                child: child,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
