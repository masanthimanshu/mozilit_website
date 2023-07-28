import 'package:flutter/material.dart';
import 'package:mozilit/components/base/app_card.dart';
import 'package:mozilit/widgets/tab_button/tab_button.dart';

class ProTab extends StatelessWidget {
  const ProTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              TabButton(
                btnIndex: 0,
                isSelected: false,
                btnItem: Text("All"),
              ),
              SizedBox(width: 40),
              TabButton(
                btnIndex: 1,
                isSelected: true,
                btnItem: Text(
                  "Pro",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 40),
              TabButton(
                btnIndex: 2,
                isSelected: false,
                btnItem: Text("Store"),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 25,
            ),
            child: Text(
              "Build apps, websites, wearables – any software you can imagine. No coding skills needed.",
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
                  productName: "Accu Weather",
                  imgName: "assets/images/pro_category.png",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
