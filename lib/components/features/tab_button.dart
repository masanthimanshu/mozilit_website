import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    required this.btnItem,
    required this.isSelected,
  });

  final Icon btnItem;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 45,
      ),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey.shade300 : Colors.white,
        border: Border.all(
          width: 2,
          color: Colors.grey.shade300,
        ),
      ),
      child: btnItem,
    );
  }
}
