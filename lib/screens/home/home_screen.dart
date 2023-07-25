import 'package:flutter/material.dart';
import 'package:mozilit/components/home/sidebar_button.dart';
import 'package:mozilit/components/home/tabs/all_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 75,
                  decoration: BoxDecoration(
                    border: Border(
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
                    child: Text("L O G O"),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 75,
                  decoration: BoxDecoration(
                    border: Border(
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
                          "1. Choose a base",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          "2. Refine features",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          "3. Plan delivery",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border(
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
                const Expanded(
                  flex: 4,
                  child: AllTab(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
