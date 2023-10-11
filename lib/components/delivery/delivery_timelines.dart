import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final timelineProvider = StateProvider<double>((ref) => 0);

class DeliveryTimelines extends ConsumerStatefulWidget {
  const DeliveryTimelines({
    super.key,
    required this.price,
    required this.timeline,
  });

  final int price;
  final int timeline;

  @override
  ConsumerState<DeliveryTimelines> createState() => _DeliveryTimelinesState();
}

class _DeliveryTimelinesState extends ConsumerState<DeliveryTimelines> {
  final _numberFormatter = NumberFormat("###,###.0#", "en_US");

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
    final res = ref.watch(timelineProvider);

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
                    value: res,
                    onChanged: (e) {
                      debugPrint("Value - $e");
                      ref.watch(timelineProvider.notifier).update((state) => e);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("₹ ${_numberFormatter.format(widget.price)}"),
                      Text("₹ ${_numberFormatter.format(widget.price * 1.5)}"),
                      Text("₹ ${_numberFormatter.format(widget.price * 2)}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${widget.timeline} weeks"),
                      Text(
                        "${(widget.timeline * 0.75).toStringAsFixed(0)} Weeks",
                      ),
                      Text(
                        "${(widget.timeline * 0.5).toStringAsFixed(0)} Weeks",
                      ),
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
                  _deliveryText[res.toInt()]["name"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _deliveryText[res.toInt()]["description"]!,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "If you kick-off on - ${DateFormat.yMMMEd().format(DateTime.now())}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Text("Estimated First delivery"),
                    Spacer(),
                    Text("04-Oct-2023"),
                  ],
                ),
                const Row(
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
