import 'package:flutter/material.dart';
import 'package:mozilit/components/home/grey_buttons.dart';

class AllTab extends StatelessWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              GreyButton(
                buttonName: "All",
                isSelected: true,
              ),
              GreyButton(
                buttonName: "Pro",
                isSelected: false,
              ),
              GreyButton(
                buttonName: "Store",
                isSelected: false,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 25,
            ),
            child: Text(
              "Choose up to 3 templates (apps similar to your idea) to use as a base.",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 15,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (e, index) {
                return Container(
                  color: Colors.grey,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
