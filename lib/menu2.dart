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
  int currentTab = 1;

  final List<MenuItem> menuList = [
    MenuItem(
      title: "Stir-Fry Noodle With Beef",
      price: "Rp30.000 - Rp40.000",
      calories: "150-220 Cal",
      imagePath: "assets/images/stirfry.png",
      ings: [
        ingridients(
          ing: ingridient(Name: "Egg noodles", price: 4000),
          amount: 100,
        ),
        ingridients(ing: ingridient(Name: "Beef", price: 15000), amount: 80),
        ingridients(ing: ingridient(Name: "Carrot", price: 2500), amount: 1),
      ],
      Steps: ["Heat oil", "Stir fry beef", "Add noodles", "Serve hot"],
    ),
    MenuItem(
      title: "Shrimp Soup ala Thai",
      price: "Rp35.000 - Rp43.000",
      calories: "300-350 Cal",
      imagePath: "assets/images/food1.png",
      ings: [
        ingridients(ing: ingridient(Name: "Shrimp", price: 8000), amount: 6),
        ingridients(
          ing: ingridient(Name: "Lemongrass", price: 3000),
          amount: 1,
        ),
        ingridients(
          ing: ingridient(Name: "Coconut Milk", price: 5000),
          amount: 200,
        ),
      ],
      Steps: [
        "Boil broth",
        "Add shrimp and herbs",
        "Pour coconut milk",
        "Finish with lime",
      ],
    ),
    MenuItem(
      title: "Chicken Caesar Salad",
      price: "Rp25.000 - Rp33.000",
      calories: "180-250 Cal",
      imagePath: "assets/images/salad.png",
      ings: [
        ingridients(
          ing: ingridient(Name: "Romaine lettuce", price: 4000),
          amount: 50,
        ),
        ingridients(
          ing: ingridient(Name: "Grilled Chicken", price: 10000),
          amount: 80,
        ),
        ingridients(
          ing: ingridient(Name: "Caesar Dressing", price: 5000),
          amount: 30,
        ),
      ],
      Steps: ["Chop lettuce", "Grill chicken", "Add dressing", "Mix and serve"],
    ),
    MenuItem(
      title: "Spaghetti Carbonara",
      price: "Rp32.000 - Rp40.000",
      calories: "400-470 Cal",
      imagePath: "assets/images/carbonara.png",
      ings: [
        ingridients(
          ing: ingridient(Name: "Spaghetti", price: 5000),
          amount: 100,
        ),
        ingridients(ing: ingridient(Name: "Egg yolk", price: 2000), amount: 2),
        ingridients(
          ing: ingridient(Name: "Smoked beef", price: 8000),
          amount: 50,
        ),
      ],
      Steps: [
        "Boil pasta",
        "Cook beef",
        "Mix egg yolk & cheese",
        "Combine all",
      ],
    ),
    MenuItem(
      title: "Tuna Mayo Onigiri",
      price: "Rp18.000 - Rp25.000",
      calories: "200-240 Cal",
      imagePath: "assets/images/onigiri.png",
      ings: [
        ingridients(ing: ingridient(Name: "Rice", price: 4000), amount: 100),
        ingridients(ing: ingridient(Name: "Tuna", price: 6000), amount: 50),
        ingridients(
          ing: ingridient(Name: "Mayonnaise", price: 3000),
          amount: 20,
        ),
      ],
      Steps: [
        "Mix tuna & mayo",
        "Form rice balls",
        "Fill with tuna",
        "Wrap with nori",
      ],
    ),
    MenuItem(
      title: "Vegan Chickpea Curry",
      price: "Rp27.000 - Rp35.000",
      calories: "320-370 Cal",
      imagePath: "assets/images/chickpea_curry.png",
      ings: [
        ingridients(
          ing: ingridient(Name: "Chickpeas", price: 5000),
          amount: 100,
        ),
        ingridients(
          ing: ingridient(Name: "Tomato puree", price: 4000),
          amount: 50,
        ),
        ingridients(ing: ingridient(Name: "Onion", price: 2000), amount: 1),
      ],
      Steps: [
        "Sauté onion",
        "Add tomato & chickpeas",
        "Simmer with spices",
        "Serve with rice",
      ],
    ),
    MenuItem(
      title: "Avocado Toast With Egg",
      price: "Rp22.000 - Rp30.000",
      calories: "250-300 Cal",
      imagePath: "assets/images/avocado_toast.png",
      ings: [
        ingridients(ing: ingridient(Name: "Bread", price: 3000), amount: 2),
        ingridients(ing: ingridient(Name: "Avocado", price: 8000), amount: 1),
        ingridients(ing: ingridient(Name: "Egg", price: 3000), amount: 1),
      ],
      Steps: ["Toast bread", "Mash avocado", "Fry egg", "Assemble and season"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // final padding = MediaQuery.of(context).padding;
    // final screenWidth = MediaQuery.of(context).size.width;

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
            child: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 160, left: 16, right: 16),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 600,
                        ), // biar di tablet ga terlalu lebar
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Menubasic(
                              title1: "Let’s Choose Your",
                              title2: "Menu !",
                            ),
                            const SizedBox(height: 24),

                            ...menuList.asMap().entries.map((entry) {
                              int index = entry.key;
                              MenuItem item = entry.value;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: MenuButton(
                                  menu: item,
                                  index: index, // ✅ dikirim ke MenuButton
                                  onNext: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                IngDetail(menuItem: item),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),

                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: currentTab),
    );
  }
}
