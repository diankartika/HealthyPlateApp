import 'package:flutter/material.dart';
import 'menu_1.dart';

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 44, 44, 44),
                      Color(0xFF1A1A1A),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title Section
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 60.0,
                        right: 80,
                        left: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today's\nrecomendation",
                            style: TextStyle(
                              color: Color(0xFF9ABD40),
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Maybe something light for today?',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),

                    // Food List Section
                    SizedBox(
                      height: 460, //Atur tinggi sesuai kebutuhan
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
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
                                    food['image'],
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .center, // Center vertically
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .center, // Center horizontally
                                    children: [
                                      Text(
                                        food['name'],
                                        textAlign:
                                            TextAlign
                                                .center, // Center text alignment
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        food['price'],
                                        textAlign:
                                            TextAlign
                                                .center, // Center text alignment
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
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Text(
                                          food['calories'],
                                          textAlign:
                                              TextAlign
                                                  .center, // Center text alignment
                                          style: const TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),

                                      // Button I want
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom:
                                              MediaQuery.of(
                                                context,
                                              ).padding.bottom +
                                              40,
                                          left: 10,
                                          right: 13,
                                          top: 10,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF9ABD40),
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                          ),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              shadowColor: Colors.transparent,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 20.0,
                                                    vertical: 7.0,
                                                  ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => const Menu1(),
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'I Want This One',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                  255,
                                                  36,
                                                  36,
                                                  36,
                                                ),
                                                fontWeight: FontWeight.w700,
                                              ),
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
                        },
                      ),
                    ),

                    // Button Section
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom + 40,
                        left: 24,
                        right: 24,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF9ABD40),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: const Color.fromARGB(255, 38, 38, 38),
                            width: 5.0,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF9ABD40).withOpacity(0.6),
                              blurRadius: 20,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
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
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 57, 57, 57),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF282828),
        selectedItemColor: const Color(0xFF9ABD40),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Customize',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
