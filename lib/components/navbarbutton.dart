import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 20,
            left: 40,
            right: 40,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFF9ABD40),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navItem(context, Icons.home, "Home", 0),
                  const SizedBox(width: 60),
                  _navItem(context, Icons.person, "Account", 2),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            child: GestureDetector(
              onTap: () => _handleNavigation(context, 1),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF9ABD40),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF9ABD40).withOpacity(0.8),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.restaurant_menu,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(
    BuildContext context,
    IconData icon,
    String label,
    int index,
  ) {
    return GestureDetector(
      onTap: () => _handleNavigation(context, index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }

  void _handleNavigation(BuildContext context, int index) {
    String targetRoute;
    switch (index) {
      case 0:
        targetRoute = '/home_screen';
        break;
      case 1:
        targetRoute = '/menu_1';
        break;
      case 2:
        targetRoute = '/account';
        break;
      default:
        return;
    }

    // Hindari push jika sudah di halaman yang sama
    if (ModalRoute.of(context)?.settings.name != targetRoute) {
      Navigator.pushReplacementNamed(context, targetRoute);
    }
  }
}
