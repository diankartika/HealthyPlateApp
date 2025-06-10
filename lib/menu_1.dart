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
  Set<String> selectedTargets = {};
  final TextEditingController _minBudgetController = TextEditingController(
    text: '30000',
  );
  final TextEditingController _maxBudgetController = TextEditingController(
    text: '45000',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Stack(
        children: [
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
                    child: ScrollableButtonGrid(
                      onTargetSelected: (Set<String> selected) {
                        selectedTargets = selected;
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

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
                                        ? Color(0xFF1A1A1A)
                                        : const Color(0xFF9ABD40),
                              ),
                              selectedColor: const Color(0xFF9ABD40),
                              backgroundColor: const Color.fromARGB(
                                255,
                                21,
                                21,
                                21,
                              ),
                              shape: const StadiumBorder(
                                side: BorderSide(color: Color(0xFF1A1A1A)),
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
                        Expanded(
                          child: _buildBudgetInput("Min", _minBudgetController),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildBudgetInput("Max", _maxBudgetController),
                        ),
                      ],
                    ),
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
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        final min =
                            int.tryParse(_minBudgetController.text) ?? 0;
                        final max =
                            int.tryParse(_maxBudgetController.text) ?? 999999;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => Menu2(
                                  selectedTargets: selectedTargets,
                                  selectedPreferences: selectedPreferences,
                                  minBudget: min,
                                  maxBudget: max,
                                ),
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
      bottomNavigationBar: CustomBottomNav(currentIndex: currentTab),
    );
  }

  Widget _buildBudgetInput(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 32, 32, 32),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: "e.g. 30000",
            hintStyle: const TextStyle(color: Colors.white54),
          ),
        ),
      ],
    );
  }
}
