import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/components/app_bar.dart';
import 'package:mozilit/components/base/sidebar_buttons.dart';
import 'package:mozilit/components/base/tabs/all_tab.dart';
import 'package:mozilit/components/base/tabs/pro_tab.dart';
import 'package:mozilit/components/base/tabs/store_tab.dart';
import 'package:mozilit/controllers/base/tab_index_controller.dart';

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

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(pageNumber: 1),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      right: BorderSide(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      bottom: BorderSide(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Filter by category",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      bottom: BorderSide(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Choose a base",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 2,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (e, index) {
                        return SidebarButton(value: index);
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: _innerTabs[tabIndex],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
