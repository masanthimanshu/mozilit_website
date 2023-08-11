import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mozilit/components/app_bar.dart';
import 'package:mozilit/components/delivery/product_phase_card.dart';
import 'package:mozilit/components/price_ticker.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final String _currDate = DateFormat.yMMMEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        Text("$_currDate (Today)"),
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
                            leadingIcon: Icon(Icons.request_page_outlined),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: ProductPhaseCard(
                            name: "Design",
                            leadingIcon: Icon(Icons.brush),
                            subData: [
                              Text("Estimated Duration : 5 Weeks"),
                              Text("Estimated Delivery Date : 09-Sep-2023"),
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
                                  "Estimated Delivery Date : 09-Sep-2023"),
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
                              Text("Estimated Delivery Date : 09-Sep-2023"),
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
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Image.asset(
                                  "assets/images/delivery_timeline.png",
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Column(
                                    children: [
                                      Text(
                                        "Relaxed",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Our most budget-friendly option for those who aren't in a hurry.",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "If you kick-off on 31 Jul 2023",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text("Estimated First delivery"),
                                          Spacer(),
                                          Text("04-Oct-2023"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Estimated Final delivery"),
                                          Spacer(),
                                          Text("13-Nov-2023"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
          const PriceTicker(
            btnText: "Done",
            routeName: "/build-card",
          ),
        ],
      ),
    );
  }
}
