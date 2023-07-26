import 'package:flutter/material.dart';
import 'package:mozilit/components/app_bar.dart';
import 'package:mozilit/components/features/mobile_preview.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(pageNumber: 2),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 80,
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
                  child: const Row(
                    children: [
                      SizedBox(width: 20),
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
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      color: Colors.grey.shade200,
                      child: const Row(
                        children: [
                          Icon(Icons.phone_android),
                          Icon(Icons.desktop_mac_outlined),
                        ],
                      ),
                    ),
                  ],
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
                        return const Text("qwerty");
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.grey.shade200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 250,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/features_image.png",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 25),
                        const FeatureMobilePreview(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
          ),
        ],
      ),
    );
  }
}
