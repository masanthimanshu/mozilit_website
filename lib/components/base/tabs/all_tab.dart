import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/components/base/app_card.dart';
import 'package:mozilit/controller/base/tabs_controller.dart';
import 'package:mozilit/network/endpoints.dart';
import 'package:mozilit/widgets/tab_button/tab_button.dart';

class AllTab extends ConsumerWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(getAllTabsData(APIEndpoints().allTabsData));

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              TabButton(
                btnIndex: 0,
                isSelected: true,
                btnItem: Text(
                  "All",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 40),
              TabButton(
                btnIndex: 1,
                isSelected: false,
                btnItem: Text("Pro"),
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
              "Choose up to 3 templates (apps similar to your idea) to use as a base.",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: res.hasValue
                ? GridView.builder(
                    itemCount: res.value!.data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 575,
                    ),
                    itemBuilder: (e, index) {
                      return AppCard(
                        value: index,
                        productName: res.value!.data[index].name,
                        imgName: "assets/images/all_category.png",
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
