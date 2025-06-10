import 'package:flutter/material.dart';
import 'menu_1.dart';
import 'menu_button.dart';
import 'ing_detail.dart';
import 'components/navbarbutton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, dynamic>> foodList = [
    {
      'image': 'assets/images/food1.png',
      'name': 'Grilled Chicken',
      'price': 'Rp25.000 - Rp35.000',
      'calories': '200-300 Cal',
    },
    {
      'image': 'assets/images/food2.png',
      'name': 'Veggie Bowl',
      'price': 'Rp20.000 - Rp30.000',
      'calories': '150-250 Cal',
    },
    {
      'image': 'assets/images/food3.png',
      'name': 'Fruit Salad',
      'price': 'Rp15.000 - Rp25.000',
      'calories': '100-180 Cal',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text(
                "Today's\nrecommendation",
                style: TextStyle(
                  color: Color(0xFF9ABD40),
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Maybe something light for today?',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 32),

              // Food List
              SizedBox(
                height: 460,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodList.length,
                  itemBuilder: (context, index) {
                    final food = foodList[index];
                    return Container(
                      width: 250,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 24, 24, 24),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            child: Image.asset(
                              food['image']!,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text(
                                  food['name']!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  food['price']!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xFF9ABD40),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    food['calories']!,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF9ABD40),
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 7,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: () {
                                    // ⬇️ Buat dummy MenuItem dari data foodList
                                    final dummyMenu = MenuItem(
                                      title: food['name']!,
                                      price: food['price']!,
                                      calories: food['calories']!,
                                      imagePath: food['image']!,
                                      ings: [
                                        ingridients(
                                          ing: ingridient(
                                            Name: "Chicken",
                                            price: 12000,
                                          ),
                                          amount: 100,
                                        ),
                                        ingridients(
                                          ing: ingridient(
                                            Name: "Spices",
                                            price: 3000,
                                          ),
                                          amount: 10,
                                        ),
                                      ],
                                      Steps: [
                                        "Prepare ingredients",
                                        "Grill or sauté",
                                        "Serve with sauce",
                                      ],
                                    );

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                IngDetail(menuItem: dummyMenu),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'I Want This One',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 32),

              // Customize My Own Menu Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9ABD40),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 16.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Menu1()),
                    );
                  },
                  child: const Text(
                    'Customize My\nOwn Menu',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
    );
  }
}
