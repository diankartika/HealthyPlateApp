import 'package:flutter/material.dart';
import 'dart:ui';
import 'step_detail.dart';
import 'menu_button.dart'; // ✅ import MenuItem, ingridients, dsb
import 'menu_basic.dart';

class IngDetail extends StatelessWidget {
  final MenuItem menuItem;

  const IngDetail({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Stack(
        children: [
          // Background blur layer
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                color: Colors.black.withAlpha(51),
              ), // ✅ no deprecation warning
            ),
          ),

          // Content layer
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Menubasic(
                  title1: "Let’s Cook!",
                  title2: "",
                ), // ✅ stepper assumed inside
                // Main content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D2D2D),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // Menu image
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                menuItem.imagePath,
                                width: 160,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Menu title
                          Text(
                            menuItem.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),

                          // How to cook button
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          StepDetail(menuItem: menuItem),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF9ABD40),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'How to cook',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Table header
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ingredient",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Quantity",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Price",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey),

                          // Ingredients
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: menuItem.ings.length,
                            separatorBuilder:
                                (_, __) => const Divider(color: Colors.grey),
                            itemBuilder: (context, index) {
                              final item = menuItem.ings[index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      item.ing.Name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${item.amount}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Rp${item.ing.price}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
