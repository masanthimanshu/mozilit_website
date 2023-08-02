import 'package:flutter/material.dart';

class FeatureDesktopPreview extends StatelessWidget {
  const FeatureDesktopPreview({super.key});

  @override
  Widget build(BuildContext context) {
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
        const Text(
          "User Profile",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("Security & Privacy"),
        const SizedBox(height: 20),
        const Text("₹ 31,909.87"),
        const SizedBox(height: 5),
        const Text("7.0 days"),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: TextButton(
            onPressed: () {},
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
