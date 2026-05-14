import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/model/productModel.dart';
import 'package:ecommerce_app/screen/detailscreen.dart';
import 'package:ecommerce_app/service/product_api.dart';
import 'package:ecommerce_app/widget/brandgrid.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  bool _showBackToTopButton = false;
  final _scrollController = ScrollController();

  final _productApi = ProductApi();
  late Future<List<ProductModel>> _future = _productApi.readData();
  final TextEditingController _searchController = TextEditingController();
  
  get logo => null;
  
  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

   @override
   void initState() {
     super.initState();
     _scrollController.addListener(() {
       if (_scrollController.position.pixels < 1200) {
         setState(() {
           _showBackToTopButton = false;
         });
       } else {
         setState(() {
           _showBackToTopButton = true;
         });
       }
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _showBackToTopButton ? _buildFloatingActionButton(context) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }

  AppBar _buildAppBar() {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      toolbarHeight: 120,
      title: Text(
        "ShopEase",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: isDark ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primary,
      foregroundColor: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.filter_list),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(8),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search products...',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: isDark ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                  color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface,
                  width: 1,
                ),
              ),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    _future = _productApi.readData();
                  });
                },
                child: FutureBuilder(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("ERROR: ${snapshot.error.toString()}"));
                    }
                    if (snapshot.connectionState == ConnectionState.done){
                      List<ProductModel> filteredProducts = snapshot.data?.where((product) => product.title.toLowerCase().contains(_searchController.text.toLowerCase())).toList() ?? [];
                      return 
                      _buildGridView(filteredProducts);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
          ],
        );
  }

  Widget _buildGridView(List<ProductModel>? products) {

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    if (products == null || products.isEmpty) {
      return Center(child: Text("No products found."));
    }

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              children: [
                _buildBrandName(),
                SizedBox(height: 16),
                _buildSlider(),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                ProductModel product = products[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => Detailscreen(item: product)));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: Theme.of(context).colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface,
                        width: 1,
                      ),
                    ),
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: CachedNetworkImage(
                            imageUrl: product.images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "\$${product.price}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Theme.of(context).colorScheme.onTertiary : Theme.of(context).colorScheme.onTertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: products.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSlider() {
    List<String> images = [
      "https://i.pinimg.com/736x/09/be/f4/09bef4d3c5d3b436fc334b7ba2dcbab2.jpg",
      "https://i.pinimg.com/736x/ef/67/69/ef6769403bb7a67768a1dea51ca130ea.jpg",
      "https://i.pinimg.com/1200x/08/08/e1/0808e1fb7ee460268f8e885c1af1fbba.jpg",
    ];

    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 16/9,
        initialPage: 0,
        autoPlayInterval: Duration(seconds: 3),
      ),
      itemBuilder: (context, index, realIndex) {
        final imageUrl = images[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            placeholder: (_, _) => Container(color: Colors.grey[300]),
            errorWidget: (_, __, ___) => Container(color: Colors.red[300]),
          ),
        );
      },
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(

      shape: CircleBorder(),
      backgroundColor: Colors.transparent,
      onPressed: () {
        _scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      },
      child: Icon(Icons.arrow_upward_rounded, color: Colors.white),
    );
  }

  Widget _buildBrandName() {
  final List<String> logo = [
    "assets/images/channel_logo.png",
    "assets/images/gucci_logo.png",
    "assets/images/nike_logo.png",
    "assets/images/adidas_logo.png",
    "assets/images/lays_logo.png",
    "assets/images/pringle_logo.png",
    "assets/images/kitkat_logo.png",
    "assets/images/coca_logo.png",
  ];
    bool isDark = Theme.of(context).brightness == Brightness.dark;

  return Column(

    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 16),
      Text(
        "Popular Brands",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      const SizedBox(height: 12),
      GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(16),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: logo.map((url) => BrandGrid(logo: url)).toList(),
      )
    ],
  );
}
}

