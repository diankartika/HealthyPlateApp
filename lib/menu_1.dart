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
              padding: const EdgeInsets.only(bottom: 160),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Menubasic(
                    title1: "Let’s Set Your Own",
                    title2: "Menu !",
                  ),
                  const SizedBox(height: 24),

                  // What's your target
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'What’s your target?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ScrollableButtonGrid(),
                  ),

                  const SizedBox(height: 16),

                  // Menu Preference
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'What’s your menu preference?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          preferences.map((pref) {
                            final isSelected = selectedPreferences.contains(
                              pref,
                            );
                            return ChoiceChip(
                              label: Text(pref),
                              labelStyle: TextStyle(
                                color:
                                    isSelected
                                        ? Colors.black
                                        : const Color(0xFF9ABD40),
                              ),
                              selectedColor: const Color(0xFF9ABD40),
                              backgroundColor: Colors.transparent,
                              shape: StadiumBorder(
                                side: BorderSide(
                                  color: const Color(0xFF9ABD40),
                                ),
                              ),
                              selected: isSelected,
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    selectedPreferences.add(pref);
                                  } else {
                                    selectedPreferences.remove(pref);
                                  }
                                });
                              },
                            );
                          }).toList(),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Budget
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'How much is your budget?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        _buildBudgetCard("Min", "Rp30.000"),
                        _buildBudgetCard("Max", "Rp45.000"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Next button
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
                          borderRadius: BorderRadius.circular(16),
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
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/account');
          }
        },
      ),
    );
  }

  Widget _buildBudgetCard(String label, String amount) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 32, 32, 32),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              amount,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
