import 'package:flutter/material.dart';

class FilterRows extends StatelessWidget {

  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onSelectedCategory;
  final EdgeInsets? padding;

  const FilterRows({
    super.key, 
    required this.categories,
    required this.selectedIndex,
    required this.onSelectedCategory,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the theme colors
    final Color selectedColor = Theme.of(context).colorScheme.primary; 
    final Color unselectedColor = Colors.grey.shade200;
    final Color textColor = Colors.black54;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      // Use the provided padding, defaulting to symmetric if none is given
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Row(
        children: List.generate(categories.length, (index) {
          final isSelected = index == selectedIndex;
          
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => onSelectedCategory(index),
              child: Container(
                // --- 1. Container for Chip Styling ---
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  // 2. Background color changes based on selection
                  color: isSelected ? selectedColor : unselectedColor,
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                    color: isSelected ? selectedColor : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    // 3. Text color changes based on selection
                    color: isSelected ? Colors.white : textColor,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}