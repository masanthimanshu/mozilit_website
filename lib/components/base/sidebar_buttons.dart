import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sidebarIdProvider = StateProvider<int?>((ref) => null);

class BaseSidebarButton extends ConsumerStatefulWidget {
  const BaseSidebarButton({
    super.key,
    required this.data,
    required this.value,
    required this.categoryId,
  });

  final int value;
  final String data;
  final int categoryId;

  @override
  ConsumerState<BaseSidebarButton> createState() => _BaseSidebarButtonState();
}

class _BaseSidebarButtonState extends ConsumerState<BaseSidebarButton> {
  int _hoverValue = 0;

  @override
  Widget build(BuildContext context) {
    final res = ref.watch(sidebarIdProvider);

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
              value: res == widget.categoryId,
              onChanged: (e) {
                res == widget.categoryId
                    ? ref
                        .read(sidebarIdProvider.notifier)
                        .update((state) => null)
                    : ref
                        .read(sidebarIdProvider.notifier)
                        .update((state) => widget.categoryId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
