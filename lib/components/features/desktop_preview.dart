import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mozilit/components/features/add_note.dart';

class FeatureDesktopPreview extends StatelessWidget {
  const FeatureDesktopPreview({
    super.key,
    required this.name,
    required this.price,
    required this.duration,
  });

  final int price;
  final String name;
  final int duration;

  @override
  Widget build(BuildContext context) {
    final numberFormatter = NumberFormat("###,###.0#", "en_US");

    return Column(
      children: [
        Container(
          width: 400,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
          ),
          child: Image.asset(
            "assets/images/features_desktop.png",
          ),
        ),
        const SizedBox(height: 30),
        Text(
          name,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("Security & Privacy"),
        const SizedBox(height: 20),
        Text("₹ ${numberFormatter.format(price)}"),
        const SizedBox(height: 5),
        Text("$duration days"),
        const SizedBox(height: 20),
        Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
          ),
          child: TextButton(
            onPressed: () => showPopupForm(context: context),
            child: const Row(
              children: [
                Icon(Icons.list_alt),
                SizedBox(width: 10),
                Text("Add Note"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
