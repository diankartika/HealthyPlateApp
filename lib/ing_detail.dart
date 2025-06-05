import 'menu_button.dart';
import 'menu_basic.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'step_detail.dart';
class IngDetail extends StatelessWidget {
  final MenuItem menuItem;

  const IngDetail({super.key, required this.menuItem});
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
                        Menubasic(title1:"Let’s Cook",title2: "",),
                        Container(
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[300], // light gray background
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                menuItem.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),

                              // "How to cook" button
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StepDetail(menuItem: menuItem),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF9ABD40),
                                  shape: StadiumBorder(),

                                ),
                                child: const Text(
                                  'How to cook',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Table headers
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Ingredient", style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text("Price", style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Divider(),

                              // Scrollable ingredients
                              SizedBox(
                                height: 200,
                                child: ListView.separated(
                                  itemCount: menuItem.ings.length,
                                  separatorBuilder: (_, __) => const Divider(),
                                  itemBuilder: (context, index) {
                                    final item = menuItem.ings[index];
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: Text(item.ing.Name)),
                                        Expanded(child: Text(item.amount.toString(), textAlign: TextAlign.center)),
                                        Expanded(child: Text(item.ing.price.toString(), textAlign: TextAlign.right)),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],

                    ),

                  ),
    ])));
  }
  }