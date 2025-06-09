import 'package:flutter/material.dart';

class ingridient {
  final int price;
  final String Name;
  ingridient({required this.Name, required this.price});
}

class ingridients {
  final ingridient ing;
  final int amount;
  ingridients({required this.ing, required this.amount});
}

class MenuItem {
  final String title;
  final String price;
  final String calories;
  final List<ingridients> ings;
  final List<String> Steps;
  final String imagePath;

  MenuItem({
    required this.title,
    required this.price,
    required this.calories,
    required this.ings,
    required this.Steps,
    required this.imagePath,
  });
}

class MenuButton extends StatelessWidget {
  final MenuItem menu;
  final VoidCallback onNext;
  final int index; // ✅ Tambahkan index untuk menampilkan nomor menu

  const MenuButton({
    super.key,
    required this.menu,
    required this.onNext,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Menu title dinamis
          Text(
            "Menu ${index + 1}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Judul menu
          Text(
            menu.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),

          // Harga
          Text(
            menu.price,
            style: const TextStyle(
              color: Color(0xFF9ABD40),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),

          // Kalori
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(221, 25, 25, 25),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              menu.calories,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Tombol
          Center(
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9ABD40),
                foregroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "I want this one",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
