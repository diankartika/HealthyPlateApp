import 'package:flutter/material.dart';
import 'menu_basic.dart';
import 'ing_detail.dart';
import 'menu_button.dart';
import 'dart:ui';
class Menu2 extends StatefulWidget {
  const Menu2({super.key});

  @override
  State<Menu2> createState() => _Menu2();
}
class _Menu2 extends State<Menu2> {
  final MenuItem item = MenuItem(
    title: "Stir-Fry Noodle With Beef",
    price: "Rp30.000 - Rp40.000",
    calories: "150-220 Cal",
    ings:[ingridients(ing:ingridient(Name:"ing 1",price:500),amount:5),ingridients(ing:ingridient(Name:"ing 2",price:300),amount:10)],
      Steps: ["Step one","Step Two"]
  );
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

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
                        Menubasic(title1:"Let’s Choose Your",title2: "Menu !",),
                        SizedBox(height: 24),
                        MenuButton(
                          menu: item,
                          onNext: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IngDetail(menuItem: item),
                              ),
                            );
                          },
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