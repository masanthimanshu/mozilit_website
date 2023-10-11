import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mozilit/components/app_bar.dart';
import 'package:mozilit/components/delivery/delivery_timelines.dart';
import 'package:mozilit/components/delivery/product_phase_card.dart';
import 'package:mozilit/components/price_ticker.dart';
import 'package:mozilit/controller/features/feature_screen_controller.dart';
import 'package:mozilit/network/endpoints.dart';

class DeliveryScreen extends ConsumerStatefulWidget {
  const DeliveryScreen({
    super.key,
    required this.name,
  });

  final String name;

  @override
  ConsumerState<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends ConsumerState<DeliveryScreen> {
  double _priceMultiple = 1;
  double _timeMultiple = 1;

  _setPrice(double value) {
    if (value == 0) {
      _timeMultiple = 1;
      _priceMultiple = 1;
    } else if (value == 1) {
      _timeMultiple = 0.75;
      _priceMultiple = 1.5;
    } else if (value == 2) {
      _timeMultiple = 0.5;
      _priceMultiple = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    final res = ref.watch(
      getFeatureScreenData(APIEndpoints().featureScreen + widget.name),
    );

    final deliveryTimeline = ref.watch(timelineProvider);

    _setPrice(deliveryTimeline);

    return Scaffold(
      body: res.hasValue
          ? Column(
              children: [
                const CustomAppBar(pageNumber: 3),
                const Divider(thickness: 2, height: 2),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Decide your deliverables",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Expected kick-off date",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Select platform for your product",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${DateFormat.yMMMEd().format(DateTime.now())} (Today)",
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  child: const Icon(Icons.android, size: 30),
                                ),
                              ),
                              const SizedBox(width: 30),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  child: const Icon(Icons.add, size: 30),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          const Text(
                            "Select phases for your product",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 50),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: ProductPhaseCard(
                                  subData: [],
                                  name: "Product Roadmap",
                                  leadingIcon: Icon(
                                    Icons.request_page_outlined,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: ProductPhaseCard(
                                  name: "Design",
                                  leadingIcon: Icon(Icons.brush),
                                  subData: [
                                    Text("Estimated Duration : 5 Weeks"),
                                    Text(
                                      "Estimated Delivery Date : 09-Sep-2023",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: ProductPhaseCard(
                                  subData: [],
                                  name: "Professional Prototype",
                                  leadingIcon: Icon(Icons.phone_android),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ProductPhaseCard(
                                  name: "MVP",
                                  leadingIcon: const Icon(Icons.lightbulb),
                                  subData: [
                                    const Text("Estimated Duration : 5 Weeks"),
                                    const Text(
                                      "Estimated Delivery Date : 09-Sep-2023",
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Platform",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      margin: const EdgeInsets.all(5),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: const Icon(Icons.android),
                                    ),
                                    const SizedBox(height: 20),
                                    const Divider(thickness: 2),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Features",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      "7 Features selected",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: ProductPhaseCard(
                                  name: "Full Build",
                                  leadingIcon: Icon(Icons.rocket_launch),
                                  subData: [
                                    Text("Estimated Duration : 5 Weeks"),
                                    Text(
                                      "Estimated Delivery Date : 09-Sep-2023",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Container(
                            color: Colors.blue.shade50,
                            padding: const EdgeInsets.all(25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "When do you want the delivery?",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                DeliveryTimelines(
                                  price: res.value!.data.totalPrice,
                                  timeline:
                                      res.value!.data.productBuildDuration,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(thickness: 2, height: 2),
                PriceTicker(
                  btnText: "Done",
                  routeName: "/build-card",
                  fixedPrice: res.value!.data.price,
                  variablePrice: res.value!.data.totalPrice * _priceMultiple,
                  timeline:
                      res.value!.data.productBuildDuration * _timeMultiple,
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
