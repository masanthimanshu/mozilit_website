import 'package:flutter/material.dart';

class BuildCarsSimilarApps extends StatelessWidget {
  const BuildCarsSimilarApps({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Similar Apps (1)",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
          Container(
            width: 500,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.sunny),
                SizedBox(width: 25),
                Text(
                  "Weather App",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            "Competitors (0)",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
