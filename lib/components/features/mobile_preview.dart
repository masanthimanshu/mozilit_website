import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mozilit/components/features/add_note.dart';

class FeatureMobilePreview extends StatelessWidget {
  const FeatureMobilePreview({
    super.key,
    required this.name,
    required this.price,
    required this.duration,
    required this.description,
  });

  final int price;
  final String name;
  final int duration;
  final String description;

  @override
  Widget build(BuildContext context) {
    final numberFormatter = NumberFormat("###,###.0#", "en_US");

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 225,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
          ),
          child: Image.asset(
            "assets/images/features_mobile.png",
          ),
        ),
        const SizedBox(width: 25),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text("Security & Privacy"),
            const SizedBox(height: 30),
            Text("₹ ${numberFormatter.format(price)}"),
            const SizedBox(height: 5),
            Text("$duration days"),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Text(description),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
              child: TextButton(
                onPressed: () => showPopupForm(context: context),
                child: const Row(
                  children: [
                    Icon(Icons.list_alt),
                    SizedBox(width: 10),
                    Text("Add Note"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
