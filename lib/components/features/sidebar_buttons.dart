import 'package:flutter/material.dart';

class FeatureSidebarButton extends StatefulWidget {
  const FeatureSidebarButton({
    super.key,
    required this.data,
    required this.value,
  });

  final int value;
  final String data;

  @override
  State<FeatureSidebarButton> createState() => _FeatureSidebarButtonState();
}

class _FeatureSidebarButtonState extends State<FeatureSidebarButton> {
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
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: _hoverValue == widget.value + 1
              ? Colors.grey.shade100
              : Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Colors.grey.shade300,
            ),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.message_rounded,
              color: Colors.grey,
            ),
            const SizedBox(width: 10),
            Text(
              widget.data,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
