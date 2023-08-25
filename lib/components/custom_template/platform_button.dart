import 'package:flutter/material.dart';

class TemplatePlatformButton extends StatefulWidget {
  const TemplatePlatformButton({
    super.key,
    required this.data,
    required this.value,
  });

  final int value;
  final String data;

  @override
  State<TemplatePlatformButton> createState() => _TemplatePlatformButtonState();
}

class _TemplatePlatformButtonState extends State<TemplatePlatformButton> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Checkbox(
            value: widget.value + 1 == _selectedValue,
            onChanged: (e) {
              if (_selectedValue == widget.value + 1) {
                setState(() {
                  _selectedValue = 0;
                });
              } else {
                setState(() {
                  _selectedValue = widget.value + 1;
                });
              }
            },
          ),
          const SizedBox(width: 15),
          Text(widget.data),
        ],
      ),
    );
  }
}
