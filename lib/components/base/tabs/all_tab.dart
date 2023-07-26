import 'package:flutter/material.dart';
import 'package:mozilit/components/base/app_card.dart';
import 'package:mozilit/components/base/category_buttons.dart';

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
                btnIndex: 0,
              ),
              SizedBox(width: 40),
              GreyButton(
                buttonName: "Pro",
                isSelected: false,
                btnIndex: 1,
              ),
              SizedBox(width: 40),
              GreyButton(
                buttonName: "Store",
                isSelected: false,
                btnIndex: 2,
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
                mainAxisExtent: 575,
              ),
              itemBuilder: (e, index) {
                return AppCard(
                  value: index,
                  imgName: "assets/images/all_category.png",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
