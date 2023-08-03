import 'package:flutter/material.dart';

class BuildCardInfo extends StatelessWidget {
  const BuildCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Buildcard basic details",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.bookmark_add_outlined),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text("Enter Name Here"),
                  SizedBox(height: 20),
                  Text(
                    "Description",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text("Enter Description Here"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
