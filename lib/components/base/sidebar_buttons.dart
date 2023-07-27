import 'package:flutter/material.dart';

class BaseSidebarButton extends StatefulWidget {
  const BaseSidebarButton({
    super.key,
    required this.data,
    required this.value,
  });

  final int value;
  final String data;

  @override
  State<BaseSidebarButton> createState() => _BaseSidebarButtonState();
}

class _BaseSidebarButtonState extends State<BaseSidebarButton> {
  int _hoverValue = 0;
  int _selectedValue = 0;

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
            Text(widget.data),
            const Spacer(),
            Checkbox(
              value: widget.value + 1 == _selectedValue,
              onChanged: (e) {
                setState(() {
                  _selectedValue = widget.value + 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
