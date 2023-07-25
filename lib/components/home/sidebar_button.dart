import 'package:flutter/material.dart';

class SidebarButton extends StatefulWidget {
  const SidebarButton({
    super.key,
    required this.value,
  });

  final int value;

  @override
  State<SidebarButton> createState() => _SidebarButtonState();
}

class _SidebarButtonState extends State<SidebarButton> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedValue = widget.value + 1;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Colors.grey.shade300,
            ),
          ),
        ),
        child: Row(
          children: [
            Text("Data ${widget.value + 1}"),
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
