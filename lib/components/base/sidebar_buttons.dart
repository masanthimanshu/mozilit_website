import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/controller/sidebar/selected_value.dart';

class BaseSidebarButton extends ConsumerStatefulWidget {
  const BaseSidebarButton({
    super.key,
    required this.data,
    required this.value,
  });

  final int value;
  final String data;

  @override
  ConsumerState<BaseSidebarButton> createState() => _BaseSidebarButtonState();
}

class _BaseSidebarButtonState extends ConsumerState<BaseSidebarButton> {
  int _hoverValue = 0;

  @override
  Widget build(BuildContext context) {
    final selectedValue = ref.watch(selectedValueProvider);

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
              value: widget.value + 1 == selectedValue,
              onChanged: (e) {
                if (selectedValue == widget.value + 1) {
                  ref.read(selectedValueProvider.notifier).update((state) => 0);
                } else {
                  ref
                      .read(selectedValueProvider.notifier)
                      .update((state) => widget.value + 1);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
