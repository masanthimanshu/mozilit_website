import 'package:flutter/material.dart';

class DeliveryTimelines extends StatefulWidget {
  const DeliveryTimelines({super.key});

  @override
  State<DeliveryTimelines> createState() => _DeliveryTimelinesState();
}

class _DeliveryTimelinesState extends State<DeliveryTimelines> {
  double _sliderIndex = 0;

  final List<Map<String, String>> _deliveryText = [
    {
      "name": "Relaxed",
      "description":
          "Our most budget-friendly option for those who aren't in a hurry.",
    },
    {
      "name": "Standard",
      "description":
          "The perfect middle ground for anyone with a modest budget and medium-term deadlines.",
    },
    {
      "name": "Speedy",
      "description":
          "We build your app at the speed of light for a premium price",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 150,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Relaxed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Standard",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Speedy",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Slider(
                    max: 2,
                    divisions: 2,
                    value: _sliderIndex,
                    onChanged: (e) {
                      setState(() {
                        _sliderIndex = e;
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("₹ 1,00,000"),
                      Text("₹ 1,50,000"),
                      Text("₹ 2,00,000"),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("12 weeks"),
                      Text("10 Weeks"),
                      Text("8 weeks"),
                    ],
                  ),
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
            child: Column(
              children: [
                Text(
                  _deliveryText[_sliderIndex.toInt()]["name"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _deliveryText[_sliderIndex.toInt()]["description"]!,
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
