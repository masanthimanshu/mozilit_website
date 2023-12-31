import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/components/app_bar.dart';
import 'package:mozilit/components/base/app_card.dart';
import 'package:mozilit/components/base/sidebar_buttons.dart';
import 'package:mozilit/controller/base/base_screen_controller.dart';
import 'package:mozilit/controller/base/base_sidebar_controller.dart';
import 'package:mozilit/network/endpoints.dart';
import 'package:mozilit/utils/serach_string.dart';
import 'package:routemaster/routemaster.dart';

class BaseScreen extends ConsumerStatefulWidget {
  const BaseScreen({super.key});

  @override
  ConsumerState<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends ConsumerState<BaseScreen> {
  final List<Map<String, dynamic>> _sidebarCategories = [];

  _sidebarSearch(String searchQuery) {
    final res = ref.watch(
      getBaseSidebarData(APIEndpoints().baseSidebar),
    );

    if (searchQuery.length <= 1) {
      _sidebarCategories.clear();

      for (var ele in res.value?.data ?? []) {
        _sidebarCategories.add(
          {"name": ele.categoryName, "id": ele.categoryId},
        );
      }

      setState(() {});
    } else {
      final data = searchWord(
        array: _sidebarCategories,
        letters: searchQuery,
      );

      _sidebarCategories.clear();
      _sidebarCategories.addAll(data);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final sidebarId = ref.watch(sidebarIdProvider);

    final sidebarData = ref.watch(
      getBaseSidebarData(APIEndpoints().baseSidebar),
    );

    final templatesData = ref.watch(
      getBaseScreenData(
        sidebarId == null
            ? APIEndpoints().baseScreen
            : APIEndpoints().baseScreenById + sidebarId.toString(),
      ),
    );

    if (_sidebarCategories.isEmpty) {
      for (var ele in sidebarData.value?.data ?? []) {
        _sidebarCategories.add(
          {"name": ele.categoryName, "id": ele.categoryId},
        );
      }
    }

    return Scaffold(
      body: sidebarData.hasValue
          ? Column(
              children: [
                const CustomAppBar(pageNumber: 1),
                const Divider(thickness: 1, height: 2),
                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.search, color: Colors.grey),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 200,
                              child: TextField(
                                onChanged: (text) => _sidebarSearch(text),
                                decoration: const InputDecoration(
                                  hintText: "Filter by category",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
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
                                  onPressed: () {
                                    Routemaster.of(context).push("/template");
                                  },
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
                          itemCount: _sidebarCategories.length,
                          itemBuilder: (e, index) {
                            return BaseSidebarButton(
                              value: index,
                              data: _sidebarCategories[index]["name"],
                              categoryId: _sidebarCategories[index]["id"],
                            );
                          },
                        ),
                      ),
                      const VerticalDivider(thickness: 1, width: 2),
                      Expanded(
                        flex: 4,
                        child: templatesData.hasValue
                            ? GridView.builder(
                                itemCount: templatesData.value!.data.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisExtent: 525,
                                ),
                                itemBuilder: (e, index) {
                                  return AppCard(
                                    value: index,
                                    price:
                                        templatesData.value!.data[index].price,
                                    featureId:
                                        templatesData.value!.data[index].id,
                                    productName:
                                        templatesData.value!.data[index].name,
                                    imgName: "assets/images/all_category.png",
                                  );
                                },
                              )
                            : const Center(child: CircularProgressIndicator()),
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
