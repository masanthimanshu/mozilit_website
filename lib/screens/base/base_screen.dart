import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/components/app_bar.dart';
import 'package:mozilit/components/base/sidebar_buttons.dart';
import 'package:mozilit/components/base/tabs/all_tab.dart';
import 'package:mozilit/components/base/tabs/pro_tab.dart';
import 'package:mozilit/components/base/tabs/store_tab.dart';
import 'package:mozilit/controller/base/base_sidebar_controller.dart';
import 'package:mozilit/network/endpoints.dart';
import 'package:mozilit/widgets/tab_button/tab_button_controller.dart';

class BaseScreen extends ConsumerStatefulWidget {
  const BaseScreen({super.key});

  @override
  ConsumerState<BaseScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<BaseScreen> {
  final List<Widget> _innerTabs = [
    const AllTab(),
    const ProTab(),
    const StoreTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final tabIndex = ref.watch(tabIndexProvider);
    final res = ref.watch(getBaseSidebarData(APIEndpoints().baseSidebar));

    return Scaffold(
      body: res.hasValue
          ? Column(
              children: [
                const CustomAppBar(pageNumber: 1),
                const Divider(thickness: 2, height: 2),
                const SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
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
                      VerticalDivider(thickness: 2, width: 2),
                      Expanded(
                        flex: 4,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Choose a base",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 2, height: 2),
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
                      const VerticalDivider(thickness: 2, width: 2),
                      Expanded(
                        flex: 4,
                        child: _innerTabs[tabIndex],
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
