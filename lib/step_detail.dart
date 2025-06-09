import 'package:flutter/material.dart';
import 'dart:ui';
import 'menu_button.dart';
import 'menu_basic.dart';
import 'components/navbarbutton.dart'; // ✅ tambahkan ini

class StepDetail extends StatefulWidget {
  final MenuItem menuItem;

  const StepDetail({super.key, required this.menuItem});

  @override
  State<StepDetail> createState() => _StepDetailState();
}

class _StepDetailState extends State<StepDetail> {
  int currentTab = 1; // Customize tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Stack(
        children: [
          // Background layer
          Positioned.fill(
            child: Container(color: const Color.fromARGB(255, 36, 36, 36)),
          ),

          // Content layer
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Menubasic(title1: "Let’s Cook", title2: ""),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D2D2D),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 12,
                            offset: const Offset(4, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.menuItem.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),

                          const SizedBox(height: 16),

                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Follow this step",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),

                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.menuItem.Steps.length,
                            separatorBuilder: (_, __) => const Divider(),
                            itemBuilder: (context, index) {
                              final step = widget.menuItem.Steps[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${index + 1}. ",
                                      style: const TextStyle(
                                        color: Color(0xFF9ABD40),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        step,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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

      // ✅ Bottom navigation bar
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentTab,
        onTabSelected: (index) {
          setState(() => currentTab = index);
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home_screen');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/customize');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/account');
          }
        },
      ),
    );
  }
}
