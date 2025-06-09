import 'package:flutter/material.dart';
import 'menu_basic.dart';
import 'ing_detail.dart';
import 'menu_button.dart';
import 'components/navbarbutton.dart';
import 'dart:ui';

class Menu2 extends StatefulWidget {
  const Menu2({super.key});

  @override
  State<Menu2> createState() => _Menu2State();
}

class _Menu2State extends State<Menu2> {
  final MenuItem item = MenuItem(
    title: "Stir-Fry Noodle With Beef",
    price: "Rp30.000 - Rp40.000",
    calories: "150-220 Cal",
    ings: [
      ingridients(ing: ingridient(Name: "ing 1", price: 500), amount: 5),
      ingridients(ing: ingridient(Name: "ing 2", price: 300), amount: 10),
    ],
    Steps: ["Step one", "Step Two"],
  );

  int currentTab = 1;
  final List<String> preferences = [
    'Vegetarian',
    'Vegan',
    'Salads',
    'Grilled Dishes',
    'Stir-Fried',
    'Steamed-Meals',
    'High-Protein',
    'Breakfast',
    'Low-Carb',
    'Whole Grain-Based',
    'Snacks & Light',
  ];
  final Set<String> selectedPreferences = {'Low-Carb'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Stack(
        children: [
          // Background layer
          Positioned.fill(
            child: Stack(
              children: [
                Container(color: const Color.fromARGB(255, 36, 36, 36)),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                    child: Container(color: Colors.black.withOpacity(0.2)),
                  ),
                ),
              ],
            ),
          ),

          // Content layer
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 160),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Menubasic(title1: "Let’s Choose Your", title2: "Menu !"),
                  const SizedBox(height: 24),

                  // Menu Card
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

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentTab,
        onTabSelected: (index) {
          setState(() => currentTab = index);
        },
      ),
    );
  }
}
