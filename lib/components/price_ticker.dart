import 'package:flutter/material.dart';

class PriceTicker extends StatelessWidget {
  const PriceTicker({
    super.key,
    required this.btnText,
    required this.routeName,
  });

  final String btnText;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CUSTOMISATION COST",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "₹2,47,818.12",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "+",
            style: TextStyle(
              fontSize: 30,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "FIXED COST",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "₹6,35,921.00",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "=",
            style: TextStyle(
              fontSize: 30,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TOTAL COST",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "₹8,83,739.00",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: VerticalDivider(
              thickness: 2,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "INDICATIVE DURATION",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "15 weeks",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 200,
            height: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, routeName);
              },
              child: Text(btnText),
            ),
          ),
        ],
      ),
    );
  }
}
