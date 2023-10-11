import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';

class AppCard extends StatefulWidget {
  const AppCard({
    super.key,
    required this.value,
    required this.price,
    required this.imgName,
    required this.featureId,
    required this.productName,
  });

  final int value;
  final int price;
  final int featureId;
  final String imgName;
  final String productName;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  final _numberFormatter = NumberFormat("###,###.0#", "en_US");

  final _hiveBox = Hive.box("myBox");
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
        margin: const EdgeInsets.all(10),
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
              "BUILD AN APP LIKE",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.productName,
              style: const TextStyle(
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
            const Text("+ 32 other features"),
            const SizedBox(height: 5),
            const Divider(),
            const SizedBox(height: 5),
            const Text(
              "FROM",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  "₹ ${_numberFormatter.format(widget.price)}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _hiveBox.get("isLoggedIn") == "true"
                          ? Routemaster.of(context).push(
                              "/feature/${widget.featureId}",
                            )
                          : Routemaster.of(context).push("login");
                    },
                    child: const Text("View Details"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
