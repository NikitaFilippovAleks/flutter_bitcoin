import 'package:flutter/material.dart';

class DarkCard extends StatelessWidget {
  final Widget child;

  const DarkCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        // vertical: 8,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 15, 14, 14),
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(12),
      child: child,
    );
  }
}
