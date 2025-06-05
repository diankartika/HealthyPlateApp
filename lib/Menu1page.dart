import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final Color backgroundColor = const Color(0xFF1C1C1E);
  final Color primaryGreen = const Color(0xFFB5FF2F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: primaryGreen),
        title: Text(
          "Let's Set Your Own Menu!",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStepIndicators(),
            SizedBox(height: 24),
            _buildSectionTitle("What's your target?"),
            _buildChips([
              'Lose Weight', 'Boost Immunity', 'Diet', 'Gain Muscle',
              'Lower Blood Sugar', 'Support', 'Increase Energy'
            ]),
            SizedBox(height: 24),
            _buildSectionTitle("What's your menu preference?"),
            _buildChips([
              'Vegetarian', 'Vegan', 'Grilled Dishes', 'Low-Carb',
              'Steamed Meals', 'Whole-Grain-Based'
            ]),
            SizedBox(height: 24),
            _buildSectionTitle("How much is your budget?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBudgetCard("Min", "Rp30.000"),
                _buildBudgetCard("Max", "Rp45.000"),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildStepIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        return CircleAvatar(
          backgroundColor: index == 0 ? primaryGreen : Colors.grey[800],
          child: Text('${index + 1}', style: TextStyle(color: Colors.black)),
        );
      }),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildChips(List<String> labels) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: labels.map((label) {
        return Chip(
          label: Text(label),
          backgroundColor: Colors.grey[850],
          labelStyle: TextStyle(color: Colors.white),
        );
      }).toList(),
    );
  }

  Widget _buildBudgetCard(String label, String amount) {
    return Container(
      width: 120,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 4),
          Text(amount, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      backgroundColor: backgroundColor,
      selectedItemColor: primaryGreen,
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    );
  }
}
