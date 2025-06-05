import 'package:flutter/material.dart';
import 'scroll_button.dart';
import 'menu_basic.dart';
import 'menu2.dart';
import 'dart:ui';
class Menu1 extends StatefulWidget {
  const Menu1({super.key});

  @override
  State<Menu1> createState() => _Menu1();
}

class _Menu1 extends State<Menu1> {
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // Important: Don't use any background color here
      body: Container(
        // Use a single Stack as the root
        child: Stack(
          // Don't use fit: StackFit.expand here
          children: [
            // Background image - positioned at the very back
            Positioned.fill(
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey[800],
                  ),

                  // Blur effect layer
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                      child: Container(
                        color: Colors.black.withOpacity(
                          0.2,
                        ), // Optional: tint color
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content layer - positioned on top of the background
              Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // Safe area for top padding
                  Menubasic(title1: "Let’s Set Your Own",title2: "Menu !"),
                  SizedBox(height:24),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                    'Whats Your Target',
                    style: TextStyle(
                      color: Colors.white,  // same green as button background
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ScrollableButtonGrid(), // <--- Use it here
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9ABD40),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Menu2()), // 👈 Replace with your next screen
                        );
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    ]
        )
      )
    );
  }
}
