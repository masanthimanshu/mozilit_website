import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/components/app_bar.dart';
import 'package:mozilit/components/features/desktop_preview.dart';
import 'package:mozilit/components/features/mobile_preview.dart';
import 'package:mozilit/components/features/sidebar_buttons.dart';
import 'package:mozilit/components/features/tab_button.dart';
import 'package:mozilit/components/price_ticker.dart';
import 'package:mozilit/controller/features/features_sidebar_controller.dart';
import 'package:mozilit/network/endpoints.dart';

class FeaturesScreen extends ConsumerStatefulWidget {
  const FeaturesScreen({
    super.key,
    required this.name,
  });

  final String name;

  @override
  ConsumerState<FeaturesScreen> createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends ConsumerState<FeaturesScreen> {
  int _screenIndex = 0;
  String _searchQuery = "";
  final List<Widget> _previews = [];

  @override
  void initState() {
    super.initState();

    _previews.add(
      FeatureMobilePreview(featureId: widget.name),
    );

    _previews.add(
      FeatureDesktopPreview(featureId: widget.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    final res = ref.watch(getFeatureSidebarData(APIEndpoints().featureSidebar));

    return Scaffold(
      body: res.hasValue
          ? Column(
              children: [
                const CustomAppBar(pageNumber: 2),
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
                                keyboardType: TextInputType.number,
                                onChanged: (text) => _searchQuery = text,
                                decoration: const InputDecoration(
                                  hintText: "Search for a feature",
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
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              color: Colors.grey.shade200,
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _screenIndex = 0;
                                      });
                                    },
                                    child: TabButton(
                                      isSelected: _screenIndex == 0,
                                      btnItem: const Icon(Icons.phone_android),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _screenIndex = 1;
                                      });
                                    },
                                    child: TabButton(
                                      isSelected: _screenIndex == 1,
                                      btnItem: const Icon(
                                        Icons.desktop_mac_outlined,
                                      ),
                                    ),
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
                          itemCount: res.value!.data.length,
                          itemBuilder: (e, index) {
                            return FeatureSidebarButton(
                              value: index,
                              data: res.value!.data[index].featureName,
                              subMenu: res.value!.data[index].subFeaature,
                            );
                          },
                        ),
                      ),
                      const VerticalDivider(thickness: 1, width: 2),
                      Expanded(
                        flex: 4,
                        child: Container(
                          color: Colors.grey.shade200,
                          child: _previews[_screenIndex],
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
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
