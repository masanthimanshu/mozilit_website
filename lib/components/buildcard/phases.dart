import 'package:flutter/material.dart';
import 'package:mozilit/components/buildcard/phase/phase_card.dart';

class BuildCardPhases extends StatelessWidget {
  const BuildCardPhases({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Phases (3)",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
          GridView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 375,
            ),
            itemBuilder: (e, index) {
              return const BuildCardPhaseCard();
            },
          ),
        ],
      ),
    );
  }
}
