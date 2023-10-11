import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

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
              onTap: () => Routemaster.of(context).push("/"),
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 5, color: Colors.black),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/mozilit_icon.png"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    "Mozilit",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const VerticalDivider(thickness: 1, width: 2),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey,
                    ),
                    child: InkWell(
                      onTap: () => Routemaster.of(context).push("/login"),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
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
