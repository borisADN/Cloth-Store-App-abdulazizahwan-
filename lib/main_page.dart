import 'package:application/app_styles.dart';
import 'package:application/home_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Index de la page actuellement affichée
  int currentIndex = 0; // Home par défaut

  final List<Widget> pages = const [
    HomeScreen(),

    Center(
      child: Text(
        "Cart Page",
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    Center(
      child: Text(
        "Favorite Page",
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    Center(
      child: Text(
        "Profile Page",
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 64,
        child: CustomNavigationBar(
          isFloating: true,
          borderRadius: const Radius.circular(40),
          selectedColor: kWhite,
          // blurEffect: true,
          unSelectedColor: kGrey,
          backgroundColor: const Color.fromARGB(255, 38, 37, 41),
          strokeColor: Colors.transparent,
          scaleFactor: 0.1,
          iconSize: 40,
          items: [
            CustomNavigationBarItem(
              // showBadge: true,
              // badgeCount: 3,
              icon: currentIndex == 0
                  ? SvgPicture.asset('assets/svg/home_icon_selected.svg')
                  : SvgPicture.asset('assets/svg/home_icon_unselected.svg'),
            ),
            CustomNavigationBarItem(
              icon: currentIndex == 1
                  ? SvgPicture.asset('assets/svg/cart_icon_selected.svg')
                  : SvgPicture.asset('assets/svg/cart_icon_unselected.svg'),
            ),
            CustomNavigationBarItem(
              icon: currentIndex == 2
                  ? SvgPicture.asset('assets/svg/favorite_icon_selected.svg')
                  : SvgPicture.asset('assets/svg/favorite_icon_unselected.svg'),
            ),
            CustomNavigationBarItem(
              icon: currentIndex == 3
                  ? SvgPicture.asset('assets/svg/account_icon_selected.svg')
                  : SvgPicture.asset('assets/svg/account_icon_unselected.svg'),
            ),
          ],
          currentIndex: currentIndex,
          onTap: (index) {
            if (index != currentIndex) {
              setState(() {
                currentIndex = index;
              });
            }
          },
        ),
      ),
    );
  }
}
