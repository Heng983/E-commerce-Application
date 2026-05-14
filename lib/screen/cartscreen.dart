import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: isDarkMode
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onPrimary,
        title: Text(
          "Cart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Your cart items will appear here.",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}