import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  const AppCard({
    super.key,
    required this.value,
    required this.imgName,
  });

  final int value;
  final String imgName;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  int _hoverValue = 0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          _hoverValue = widget.value + 1;
        });
      },
      onExit: (e) {
        setState(() {
          _hoverValue = 0;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          boxShadow: _hoverValue == widget.value + 1
              ? [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "STUDIO STORE",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "E Commerce Website",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            Image.asset(widget.imgName),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              "INCLUDED FEATURES",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            const Text("Order Management, Payments, Shopping Cart"),
            const SizedBox(height: 5),
            const Text("+ 41 other features"),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              "FROM",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                const Text(
                  "₹ 5,999",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  " / month",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, "/feature"),
                  child: const Text("View Details"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
