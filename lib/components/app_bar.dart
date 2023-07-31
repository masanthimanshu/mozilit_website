import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.pageNumber,
  });

  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/"),
              child: const Center(
                child: Text("L O G O"),
              ),
            ),
          ),
          const VerticalDivider(thickness: 2, width: 2),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const Text(
                    "1. Choose a base",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "2. Refine features",
                    style: TextStyle(
                      color: pageNumber > 1 ? Colors.black : Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "3. Plan delivery",
                    style: TextStyle(
                      color: pageNumber > 2 ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
