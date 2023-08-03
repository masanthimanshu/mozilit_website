import 'package:flutter/material.dart';

class BuildCardPhaseCard extends StatelessWidget {
  const BuildCardPhaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Colors.grey.shade200,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Design",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            const Text("Platform"),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
              child: const Icon(Icons.android),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              "Buildcard Speed",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text("Relaxed"),
            const SizedBox(height: 5),
            const LinearProgressIndicator(
              value: 0.2,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
