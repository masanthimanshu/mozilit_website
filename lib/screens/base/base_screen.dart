import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/components/app_bar.dart';
import 'package:mozilit/components/base/all_tab.dart';
import 'package:mozilit/components/base/sidebar_buttons.dart';
import 'package:mozilit/controller/base/base_sidebar_controller.dart';
import 'package:mozilit/network/endpoints.dart';

class BaseScreen extends ConsumerWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(getBaseSidebarData(APIEndpoints().baseSidebar));

    return Scaffold(
      body: res.hasValue
          ? Column(
              children: [
                const CustomAppBar(pageNumber: 1),
                const Divider(thickness: 1, height: 2),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            "Filter by category",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const VerticalDivider(thickness: 1, width: 2),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Text(
                                "Choose a base",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text("Custom Template"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, height: 2),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListView.builder(
                          itemCount: res.value!.data.length,
                          itemBuilder: (e, index) {
                            return BaseSidebarButton(
                              value: index,
                              data: res.value!.data[index].categoryName,
                            );
                          },
                        ),
                      ),
                      const VerticalDivider(thickness: 1, width: 2),
                      const Expanded(
                        flex: 4,
                        child: AllTab(),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
