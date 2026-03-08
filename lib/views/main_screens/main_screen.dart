import 'package:flutter/material.dart';
import 'package:shop_app/views/main_screens/account_screen.dart';
import 'package:shop_app/views/main_screens/cart_screen.dart';
import 'package:shop_app/views/main_screens/categories_screen.dart';
import 'package:shop_app/views/main_screens/favorite_screen.dart';
import 'package:shop_app/views/main_screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
    CartScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: _pageIndex,
        onTap: (value){
          setState(() {
            _pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Image.asset('assets/icons/home.png', width: 20), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category, size: 20,color: Colors.black,), label: 'Categories'),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/love.png', width: 20), label: 'FAVORITE'),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/cart.png', width: 20), label: 'Cart'),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/user.png', width: 20), label: 'Account'),
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}