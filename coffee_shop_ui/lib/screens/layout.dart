import 'package:coffee_shop/screens/home_screen.dart';
import 'package:coffee_shop/theme/app_color.dart';
import 'package:coffee_shop/theme/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  List<Widget> screens = [HomeScreen(),HomeScreen(),HomeScreen(),HomeScreen(),];

  void onTap(int i){
    setState(() {
      currentIndex = i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(index: currentIndex,children: screens,),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColor.first,
          onTap: onTap,
          currentIndex: currentIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColor.second,showSelectedLabels: false,showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(size: 30), // <- taille icône sélectionnée
          unselectedIconTheme: IconThemeData(size: 24), // <- taille icônes non sélectionnées
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.house_alt_fill), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag_fill), label: 'Shop'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart_fill), label: 'Like'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.bell_fill), label: 'Notif'),   ],
        ),
      
      ),
    );
  }
}

