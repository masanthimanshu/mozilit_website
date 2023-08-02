import 'package:flutter/material.dart';

class ProductPhaseCard extends StatelessWidget {
  const ProductPhaseCard({
    super.key,
    required this.name,
    required this.subData,
    required this.leadingIcon,
  });

  final String name;
  final Icon leadingIcon;
  final List<Widget> subData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                leadingIcon,
                const SizedBox(width: 10),
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.question_mark,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...subData,
          ],
        ),
      ),
    );
  }
}
