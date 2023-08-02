import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/components/app_bar.dart';
import 'package:mozilit/components/features/desktop_preview.dart';
import 'package:mozilit/components/features/mobile_preview.dart';
import 'package:mozilit/components/features/sidebar_buttons.dart';
import 'package:mozilit/components/price_ticker.dart';
import 'package:mozilit/widgets/tab_button/tab_button.dart';
import 'package:mozilit/widgets/tab_button/tab_button_controller.dart';

class FeaturesScreen extends ConsumerStatefulWidget {
  const FeaturesScreen({super.key});

  @override
  ConsumerState<FeaturesScreen> createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends ConsumerState<FeaturesScreen> {
  final List<Widget> _previews = [
    const FeatureMobilePreview(),
    const FeatureDesktopPreview(),
  ];

  @override
  Widget build(BuildContext context) {
    final tabIndex = ref.watch(tabIndexProvider);

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(pageNumber: 2),
          const Divider(thickness: 2, height: 2),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text(
                        "Search for a feature",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(thickness: 2, width: 2),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        color: Colors.grey.shade200,
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            TabButton(
                              btnIndex: 0,
                              isSelected: tabIndex == 0,
                              btnItem: const Icon(Icons.phone_android),
                            ),
                            TabButton(
                              btnIndex: 1,
                              isSelected: tabIndex == 1,
                              btnItem: const Icon(Icons.desktop_mac_outlined),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 2,
            thickness: 2,
            color: Colors.grey.shade200,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (e, index) {
                      return FeatureSidebarButton(
                        value: index,
                        data: "Socials",
                      );
                    },
                  ),
                ),
                const VerticalDivider(thickness: 2, width: 2),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.grey.shade200,
                    child: _previews[tabIndex],
                  ),
                ),
              ],
            ),
          ),
          const PriceTicker(
            routeName: "/delivery",
            btnText: "Plan Delivery",
          ),
        ],
      ),
    );
  }
}
