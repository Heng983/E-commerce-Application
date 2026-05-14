import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/model/productModel.dart';
import 'package:flutter/material.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({super.key, required this.item});

  final ProductModel item;
  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primary,
        foregroundColor: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
        title: Text(
          widget.item.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: _buildBody(widget.item),
    );
  }

  Widget _buildBody(ProductModel item) {
    List<String> images = this.widget.item.images;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 0.9,
              aspectRatio: 1,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
            ),
            itemCount: item.images.length,
            itemBuilder: (context, index, realIndex) {
              final item = images[index];
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (_, _) => Container(color: Colors.grey),
                    errorWidget: (_, _, _) => Container(color: Colors.red),
                  ),
                ),
                );
            }
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "\$${item.price}",
                  style: TextStyle(
                    fontSize: 20,
                    color: isDark ? Theme.of(context).colorScheme.onTertiary : Theme.of(context).colorScheme.onTertiary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Detail',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                    ),
                ),
                SizedBox(height: 16),
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 42),
                    backgroundColor: isDark ? Theme.of(context).colorScheme.onTertiary : Theme.of(context).colorScheme.onTertiary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_outlined, 
                    color: Colors.white),
                  label: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      ),
                    ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}