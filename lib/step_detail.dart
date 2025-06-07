import 'menu_button.dart';
import 'menu_basic.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class StepDetail extends StatelessWidget {
  final MenuItem menuItem;

  const StepDetail({super.key, required this.menuItem});
  @override
  Widget build(BuildContext context) {
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
                  Container(color: const Color.fromARGB(255, 36, 36, 36)),
                ],
              ),
            ),
            // Content layer - positioned on top of the background
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Menubasic(title1: "Let’s Cook", title2: ""),
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D2D2D),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 12,
                          offset: const Offset(4, 4),
                        ),
                      ], // light gray background
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          menuItem.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // "How to cook" button
                        const SizedBox(height: 16),
                        // Table headers
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

                        // Scrollable ingredients
                        SizedBox(
                          height: 200,
                          child: ListView.separated(
                            itemCount: menuItem.Steps.length,
                            separatorBuilder: (_, __) => const Divider(),
                            itemBuilder: (context, index) {
                              final item = menuItem.Steps[index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      style: TextStyle(color: Colors.white),
                                      item,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
