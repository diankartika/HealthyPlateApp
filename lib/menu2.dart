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
        ), // gram
        ingridients(
          ing: ingridient(Name: "Beef sirloin, thinly sliced", price: 15000),
          amount: 80,
        ),
        ingridients(
          ing: ingridient(Name: "Carrot, julienned", price: 2500),
          amount: 1,
        ), // piece
        ingridients(
          ing: ingridient(Name: "Soy sauce", price: 1000),
          amount: 1,
        ), // tbsp
        ingridients(
          ing: ingridient(Name: "Garlic, minced", price: 500),
          amount: 2,
        ), // cloves
        ingridients(
          ing: ingridient(Name: "Vegetable oil", price: 1000),
          amount: 1,
        ), // tbsp
      ],
      Steps: [
        "Boil egg noodles until al dente, then drain and set aside.",
        "Heat 1 tbsp of oil in a pan over medium heat.",
        "Add beef slices, stir-fry until browned and cooked through.",
        "Add sliced carrots, cook until slightly softened.",
        "Add noodles to the pan and stir-fry for 2–3 minutes.",
        "Season with soy sauce, salt, and pepper to taste.",
        "Serve hot with optional sesame seeds.",
      ],
    ),
    MenuItem(
      title: "Shrimp Soup ala Thai",
      price: "Rp35.000 - Rp43.000",
      calories: "300-350 Cal",
      imagePath: "assets/images/food1.png",
      ings: [
        ingridients(
          ing: ingridient(Name: "Shrimp, peeled and deveined", price: 8000),
          amount: 6,
        ), // pieces
        ingridients(
          ing: ingridient(Name: "Lemongrass, crushed", price: 3000),
          amount: 1,
        ), // stalk
        ingridients(
          ing: ingridient(Name: "Coconut milk", price: 5000),
          amount: 200,
        ), // ml
        ingridients(
          ing: ingridient(Name: "Chicken broth", price: 3000),
          amount: 500,
        ), // ml
        ingridients(
          ing: ingridient(Name: "Lime juice", price: 1000),
          amount: 1,
        ), // tbsp
        ingridients(
          ing: ingridient(Name: "Chili slices", price: 1000),
          amount: 3,
        ), // pieces
        ingridients(
          ing: ingridient(Name: "Fish sauce", price: 1000),
          amount: 1,
        ), // tbsp
      ],

      Steps: [
        "Boil 500ml of water or chicken broth in a pot.",
        "Add crushed lemongrass and simmer for 5 minutes.",
        "Add cleaned shrimp and cook until they turn pink.",
        "Pour in the coconut milk and stir well.",
        "Add fish sauce, chili, and lime juice to taste.",
        "Simmer for another 3 minutes without boiling.",
        "Serve hot with fresh coriander or lime wedges.",
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
        ), // gram
        ingridients(
          ing: ingridient(Name: "Grilled chicken breast, sliced", price: 10000),
          amount: 80,
        ),
        ingridients(
          ing: ingridient(Name: "Caesar dressing", price: 5000),
          amount: 30,
        ), // gram
        ingridients(
          ing: ingridient(Name: "Croutons", price: 2000),
          amount: 20,
        ), // gram
        ingridients(
          ing: ingridient(Name: "Parmesan cheese, grated", price: 3000),
          amount: 10,
        ), // gram
      ],
      Steps: [
        "Wash and chop romaine lettuce, then pat dry.",
        "Grill chicken breast with salt and pepper, slice thinly.",
        "Place lettuce in a large bowl.",
        "Add grilled chicken slices and Caesar dressing.",
        "Toss gently until evenly coated.",
        "Top with croutons and parmesan if available.",
        "Serve immediately while fresh and cold.",
      ],
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
        ), // gram
        ingridients(
          ing: ingridient(Name: "Egg yolk", price: 2000),
          amount: 2,
        ), // pcs
        ingridients(
          ing: ingridient(Name: "Smoked beef or bacon", price: 8000),
          amount: 50,
        ), // gram
        ingridients(
          ing: ingridient(Name: "Parmesan cheese", price: 3000),
          amount: 20,
        ), // gram
        ingridients(
          ing: ingridient(Name: "Black pepper", price: 500),
          amount: 1,
        ), // tsp
      ],
      Steps: [
        "Boil spaghetti until al dente, then drain and reserve some pasta water.",
        "Cook smoked beef in a pan until crisp, set aside.",
        "In a bowl, mix egg yolks with grated cheese and black pepper.",
        "Add drained spaghetti to the pan (off the heat).",
        "Quickly mix in the egg mixture, stirring vigorously.",
        "Add beef and splash of pasta water if needed for creaminess.",
        "Serve warm with extra cheese on top.",
      ],
    ),
    MenuItem(
      title: "Tuna Mayo Onigiri",
      price: "Rp18.000 - Rp25.000",
      calories: "200-240 Cal",
      imagePath: "assets/images/onigiri.png",
      ings: [
        ingridients(
          ing: ingridient(Name: "Cooked Japanese rice", price: 4000),
          amount: 100,
        ), // gram
        ingridients(
          ing: ingridient(Name: "Canned tuna in oil", price: 6000),
          amount: 50,
        ), // gram
        ingridients(
          ing: ingridient(Name: "Mayonnaise", price: 3000),
          amount: 20,
        ), // gram
        ingridients(
          ing: ingridient(Name: "Salt", price: 200),
          amount: 1,
        ), // pinch
        ingridients(
          ing: ingridient(Name: "Nori seaweed", price: 1000),
          amount: 1,
        ), // sheet
      ],
      Steps: [
        "Cook rice and let it cool slightly.",
        "In a bowl, mix canned tuna with mayonnaise and a pinch of salt.",
        "Wet hands with water and shape rice into triangle base.",
        "Add spoonful of tuna mix in the center.",
        "Cover with more rice and press into onigiri shape.",
        "Wrap with seaweed (nori) strip.",
        "Serve fresh or keep chilled for lunchbox.",
      ],
    ),
    MenuItem(
      title: "Vegan Chickpea Curry",
      price: "Rp27.000 - Rp35.000",
      calories: "320-370 Cal",
      imagePath: "assets/images/chickpea_curry.png",
      ings: [
        ingridients(
          ing: ingridient(Name: "Boiled chickpeas", price: 5000),
          amount: 100,
        ), // gram
        ingridients(
          ing: ingridient(Name: "Tomato puree", price: 4000),
          amount: 50,
        ), // gram
        ingridients(
          ing: ingridient(Name: "Onion, chopped", price: 2000),
          amount: 1,
        ), // piece
        ingridients(
          ing: ingridient(Name: "Curry powder", price: 1000),
          amount: 1,
        ), // tsp
        ingridients(
          ing: ingridient(Name: "Vegetable oil", price: 1000),
          amount: 1,
        ), // tbsp
        ingridients(
          ing: ingridient(Name: "Salt", price: 200),
          amount: 1,
        ), // tsp
      ],
      Steps: [
        "Sauté chopped onion in oil until translucent.",
        "Add tomato puree and cook until thickened.",
        "Add drained chickpeas and stir well.",
        "Season with curry powder, salt, and pepper.",
        "Add a bit of water and simmer for 10 minutes.",
        "Let flavors meld and sauce thicken.",
        "Serve warm with steamed rice or flatbread.",
      ],
    ),
    MenuItem(
      title: "Avocado Toast With Egg",
      price: "Rp22.000 - Rp30.000",
      calories: "250-300 Cal",
      imagePath: "assets/images/avocado_toast.png",
      ings: [
        ingridients(
          ing: ingridient(Name: "Bread slice", price: 3000),
          amount: 2,
        ), // slices
        ingridients(
          ing: ingridient(Name: "Ripe avocado", price: 8000),
          amount: 1,
        ), // piece
        ingridients(
          ing: ingridient(Name: "Egg", price: 3000),
          amount: 1,
        ), // piece
        ingridients(
          ing: ingridient(Name: "Lemon juice", price: 1000),
          amount: 1,
        ), // tsp
        ingridients(
          ing: ingridient(Name: "Salt & pepper", price: 500),
          amount: 1,
        ), // pinch
      ],
      Steps: [
        "Toast slices of bread until golden brown.",
        "Cut and mash avocado with salt, pepper, and lemon juice.",
        "Fry egg sunny side up or to preferred doneness.",
        "Spread mashed avocado over toast.",
        "Top with fried egg and sprinkle chili flakes if desired.",
        "Serve immediately while warm and crispy.",
      ],
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
