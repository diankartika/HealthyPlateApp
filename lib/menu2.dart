// menu2.dart — filtered version
import 'package:flutter/material.dart';
import 'menu_basic.dart';
import 'ing_detail.dart';
import 'menu_button.dart';
import 'components/navbarbutton.dart';
import 'menu_data.dart'; // Tambahkan ini jika belum
import 'dart:ui';

class Menu2 extends StatefulWidget {
  final Set<String> selectedTargets;
  final Set<String> selectedPreferences;
  final int minBudget;
  final int maxBudget;
  final bool ignoreFilters;

  const Menu2({
    super.key,
    required this.selectedTargets,
    required this.selectedPreferences,
    required this.minBudget,
    required this.maxBudget,
    this.ignoreFilters = false,
  });

  @override
  State<Menu2> createState() => _Menu2State();
}

class _Menu2State extends State<Menu2> {
  int currentTab = 1;

  late final List<MenuItem> filteredList;

  @override
  void initState() {
    super.initState();
    filteredList = _filterMenu(menuList);
  }

  List<MenuItem> _filterMenu(List<MenuItem> fullList) {
    return fullList.where((item) {
      final prices = item.price.replaceAll("Rp", "").split(" - ");
      final minPrice = int.tryParse(prices[0].replaceAll(".", "")) ?? 0;
      final maxPrice = int.tryParse(prices[1].replaceAll(".", "")) ?? 999999;

      final matchesBudget =
          minPrice >= widget.minBudget && maxPrice <= widget.maxBudget;
      final matchesPref = widget.selectedPreferences.any(
        (p) => item.title.toLowerCase().contains(p.toLowerCase()),
      );
      final matchesTarget = widget.selectedTargets.any(
        (t) => item.title.toLowerCase().contains(t.toLowerCase()),
      );

      return matchesBudget && (matchesPref || matchesTarget);
    }).toList();
  }

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
                    child: Container(color: Colors.black.withOpacity(0.2)),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.only(
                      bottom: 160,
                      left: 16,
                      right: 16,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Menubasic(
                              title1: "Let’s Choose Your",
                              title2: "Menu !",
                            ),
                            const SizedBox(height: 24),
                            if (filteredList.isEmpty)
                              const Text(
                                "No menu found with selected filters",
                                style: TextStyle(color: Colors.white),
                              ),
                            ...filteredList.asMap().entries.map((entry) {
                              int index = entry.key;
                              MenuItem item = entry.value;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: MenuButton(
                                  menu: item,
                                  index: index,
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

// NOTE:
// Pastikan kamu memindahkan definisi menuList dan model MenuItem ke file terpisah jika panjang,
// atau tambahkan menuList di atas class Menu2 seperti sebelumnya untuk integrasi penuh.
