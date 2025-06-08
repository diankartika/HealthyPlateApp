import 'package:flutter/material.dart';
import 'scroll_button.dart';
import 'menu_basic.dart';
import 'menu2.dart';
import 'components/navbarbutton.dart';
import 'dart:ui';

class Menu1 extends StatefulWidget {
  const Menu1({super.key});

  @override
  State<Menu1> createState() => _Menu1State();
}

class _Menu1State extends State<Menu1> {
  int currentTab = 1; // karena Menu1 adalah halaman Customize

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Stack(
        children: [
          // Background layer + blur
          Positioned.fill(
            child: Stack(
              children: [
                Container(color: const Color.fromARGB(255, 36, 36, 36)),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                    child: Container(
                      color: const Color.fromARGB(
                        255,
                        36,
                        36,
                        36,
                      ).withOpacity(0.2),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Menubasic(
                    title1: "Let’s Set Your Own",
                    title2: "Menu !",
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Whats Your Target',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ScrollableButtonGrid(),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9ABD40),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Menu2(),
                          ),
                        );
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentTab,
        onTabSelected: (index) {
          setState(() {
            currentTab = index;
          });

          // Navigasi manual antar halaman jika diperlukan
          if (index == 0) {
            Navigator.pushReplacementNamed(
              context,
              '/home',
            ); // pastikan route ada
          } else if (index == 1) {
            // sedang di halaman ini (Customize), tidak perlu pindah
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/account');
          }
        },
      ),
    );
  }
}
