import 'package:flutter/material.dart';

class GreyButton extends StatelessWidget {
  const GreyButton({
    super.key,
    required this.buttonName,
    required this.isSelected,
  });

  final String buttonName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 45,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade300 : Colors.transparent,
          border: Border.all(
            width: 2,
            color: Colors.grey.shade300,
          ),
        ),
        child: Text(
          buttonName,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
