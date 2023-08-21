import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/components/base/app_card.dart';
import 'package:mozilit/controller/base/base_screen_controller.dart';
import 'package:mozilit/network/endpoints.dart';

class AllTab extends ConsumerWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(getAllTabsData(APIEndpoints().baseScreen));

    return Padding(
      padding: const EdgeInsets.all(10),
      child: res.hasValue
          ? GridView.builder(
              itemCount: res.value!.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 525,
              ),
              itemBuilder: (e, index) {
                return AppCard(
                  value: index,
                  featureId: res.value!.data[index].id,
                  productName: res.value!.data[index].name,
                  imgName: "assets/images/all_category.png",
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
