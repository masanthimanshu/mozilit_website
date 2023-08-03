import 'package:flutter/material.dart';

class BuildCardFeatures extends StatelessWidget {
  const BuildCardFeatures({super.key});

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
          GridView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 40,
            ),
            itemBuilder: (e, index) {
              return const Row(
                children: [
                  Icon(Icons.list_rounded),
                  SizedBox(width: 20),
                  Text("Account Creation"),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
