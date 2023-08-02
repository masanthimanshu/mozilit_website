import 'package:flutter/material.dart';

class FeatureMobilePreview extends StatelessWidget {
  const FeatureMobilePreview({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Text(
              "User Profile",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text("Security & Privacy"),
            const SizedBox(height: 30),
            const Text("₹ 31,909.87"),
            const Text("7.0 days"),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(Icons.list_alt),
                  SizedBox(width: 10),
                  Text("Add Note"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
