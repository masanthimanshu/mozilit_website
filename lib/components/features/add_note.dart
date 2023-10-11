import 'package:flutter/material.dart';

const String _hintText =
    "Tell us exactly what you’re expecting this feature to do (if it needs to include your images and text – attach these too).";

void showPopupForm({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("How do you want this to work?"),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("Submit"),
          ),
        ],
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
            const Text(
              "Add text, images and attachments to explain...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 250,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                onChanged: (text) {},
                decoration: const InputDecoration(
                  hintText: _hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
