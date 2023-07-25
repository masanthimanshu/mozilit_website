import 'package:flutter/material.dart';
import 'package:mozilit/components/home/grey_buttons.dart';

class StoreTab extends StatelessWidget {
  const StoreTab({super.key});

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
              SizedBox(width: 40),
              GreyButton(
                buttonName: "Pro",
                isSelected: false,
              ),
              SizedBox(width: 40),
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
              ),
              itemBuilder: (e, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  color: Colors.grey.shade300,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
