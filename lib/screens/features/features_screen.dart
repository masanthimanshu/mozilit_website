import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/components/app_bar.dart';
import 'package:mozilit/components/features/desktop_preview.dart';
import 'package:mozilit/components/features/mobile_preview.dart';
import 'package:mozilit/components/features/sidebar_buttons.dart';
import 'package:mozilit/components/features/tab_button.dart';
import 'package:mozilit/components/price_ticker.dart';
import 'package:mozilit/controller/features/feature_screen_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    final res = ref.watch(
      getFeatureScreenData(APIEndpoints().featureScreen + widget.name),
    );

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
                          itemCount: res.value!.data.feaature.length,
                          itemBuilder: (e, index) {
                            final data = res.value!.data.feaature[index];

                            return FeatureSidebarButton(
                              value: index,
                              data: data.feaature.featureName,
                              subMenu: data.feaature.subFeature,
                            );
                          },
                        ),
                      ),
                      const VerticalDivider(thickness: 1, width: 2),
                      Expanded(
                        flex: 4,
                        child: Container(
                          color: Colors.grey.shade200,
                          child: _screenIndex == 0
                              ? FeatureMobilePreview(
                                  price: res.value!.data.price,
                                  name: res.value!.data.name,
                                  description: res.value!.data.description,
                                  duration:
                                      res.value!.data.productBuildDuration,
                                )
                              : FeatureDesktopPreview(
                                  name: res.value!.data.name,
                                  price: res.value!.data.price,
                                  duration:
                                      res.value!.data.productBuildDuration,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                PriceTicker(
                  btnText: "Plan Delivery",
                  fixedPrice: res.value!.data.price,
                  routeName: "/delivery/${widget.name}",
                  variablePrice: res.value!.data.totalPrice.toDouble(),
                  timeline: res.value!.data.productBuildDuration.toDouble(),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
