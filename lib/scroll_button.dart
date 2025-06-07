import 'package:flutter/material.dart';

class ScrollableButtonGrid extends StatefulWidget {
  @override
  _ScrollableButtonGridState createState() => _ScrollableButtonGridState();
}

class _ScrollableButtonGridState extends State<ScrollableButtonGrid> {
  // Sample data with label and unique ID
  final List<Map<String, dynamic>> buttonData = List.generate(
    20,
    (index) => {'id': index, 'label': 'Cihuuyyyyy ${index + 1}'},
  );

  // Track selected buttons by ID
  final Set<int> selectedButtons = {};

  @override
  Widget build(BuildContext context) {
    // Split data into columns of 3 rows each
    final int rowsPerColumn = 3;
    final int totalColumns = (buttonData.length / rowsPerColumn).ceil();

    List<List<Map<String, dynamic>>> columns = List.generate(totalColumns, (
      columnIndex,
    ) {
      int start = columnIndex * rowsPerColumn;
      int end = (start + rowsPerColumn).clamp(0, buttonData.length);
      return buttonData.sublist(start, end);
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            columns.map((column) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:
                      column.map((data) {
                        final bool isSelected = selectedButtons.contains(
                          data['id'],
                        );
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  isSelected
                                      ? const Color(0xFF9ABD40)
                                      : const Color.fromARGB(255, 21, 21, 21),
                              foregroundColor:
                                  isSelected
                                      ? const Color.fromARGB(255, 21, 21, 21)
                                      : const Color(0xFF9ABD40),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (isSelected) {
                                  selectedButtons.remove(data['id']);
                                } else {
                                  selectedButtons.add(data['id']);
                                }
                              });
                            },
                            child: Text(data['label']),
                          ),
                        );
                      }).toList(),
                ),
              );
            }).toList(),
      ),
    );
  }
}
