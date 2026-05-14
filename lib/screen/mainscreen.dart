import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:ecommerce_app/screen/cartscreen.dart';
import 'package:ecommerce_app/screen/favoritescreen.dart';
import 'package:ecommerce_app/screen/homepage.dart';
import 'package:ecommerce_app/screen/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

int _selectedIndex = 0;

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody(){
    return IndexedStack(
      index: _selectedIndex,
      children: [
        HomePage(),
        FavoriteScreen(),
        CartScreen(),
        Profilescreen(),
      ],
    );
  }

  Widget _buildBottomNavigationBar(){
    return CrystalNavigationBar(
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.white,
      borderWidth: 2,
      outlineBorderColor: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.5),
      onTap: (int i){
        setState(() {
          _selectedIndex = i;
        });
      },
      items: [
        CrystalNavigationBarItem(
          icon: IconlyBold.home,
          unselectedIcon: IconlyLight.home,
          selectedColor: Colors.white
          ),

         CrystalNavigationBarItem(
          icon: IconlyBold.heart,
          unselectedIcon: IconlyLight.heart,
          selectedColor: Colors.white
        ),

        CrystalNavigationBarItem(
          icon: IconlyBold.buy,
          unselectedIcon: IconlyLight.buy,
          selectedColor: Colors.white
          ),

          CrystalNavigationBarItem(
            icon:IconlyBold.profile,
            unselectedIcon: IconlyLight.profile,
            selectedColor: Colors.white
          )
      ],
      );

  }
}