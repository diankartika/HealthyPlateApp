import 'package:flutter/material.dart';

class Menubasic extends StatelessWidget {
  final String title1;
  final String title2;
  const Menubasic({super.key, required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Safe area for top padding
        SafeArea(
          bottom: false,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 20.0),
              child: Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFF9ABD40),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Color.fromARGB(255, 27, 27, 27),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Title
        Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: Text(
            title1,
            style: TextStyle(
              color: Color(0xFF9ABD40),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: Text(
            title2,
            style: TextStyle(
              color: Color(0xFF9ABD40),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // Step Indicator: 1 ... 2 ... 3
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 24),

            _stepCircle('1'),
            _stepDots(),
            _stepCircle('2'),
            _stepDots(),
            _stepCircle('3'),
          ],
        ),
      ],
    );
  }

  // Circle step widget
  Widget _stepCircle(String label) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.only(left: 12.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF9ABD40), width: 3),
        color: Colors.transparent,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF9ABD40),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  // Connecting dots
  Widget _stepDots() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Row(
        children: List.generate(5, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF9ABD40),
            ),
          );
        }),
      ),
    );
  }
}
