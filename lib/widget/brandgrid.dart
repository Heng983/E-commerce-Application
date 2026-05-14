import 'package:flutter/material.dart';

class BrandGrid extends StatelessWidget {
  final String logo;
  
  const BrandGrid({Key? key, required this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Image.asset(
          logo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}