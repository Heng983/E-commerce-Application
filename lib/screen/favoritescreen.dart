import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: isDark
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onPrimary,
        title: Text(
          "Favorites",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Your favorite items will appear here.",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}